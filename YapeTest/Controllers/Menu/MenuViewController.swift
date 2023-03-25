//
//  MenuViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit

struct itemTableViewModel {
    let name: String
    let desc: String
    let images: String
    let price: String
    let latitude: String
    let longitude: String
    init(name: String, desc: String,
         images: String, price: String,
         latitude: String ,longitude: String) {
        self.name = name
        self.desc = desc
        self.images = images
        self.price = price
        self.latitude = latitude
        self.longitude = longitude
    }
}

class MenuViewController: UIViewController {

    var listMenus = [Product]()
    var searching = false
    var searchedMenu =  [Product]()
    let searchController = UISearchController(searchResultsController: nil)
 
    // MARK: - IBOutlets
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.register(MenuTableViewCell.self, forCellReuseIdentifier: "MenuTableViewCell")
        table.rowHeight = 200.0
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    // MARK: - init
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
   
    // MARK: - call MenuListViewModel
    public var menuListVM: MenuListViewModel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        startloading()
        view.backgroundColor = UIColor.white
        setUpTableView()
        setupVM()
        configureSearchController()
        setUpButtonCarro()
    }
    private func setUpButtonCarro() {
        let buttonIcon = UIImage(named: "ico-cart")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: buttonIcon,
            style: .plain,
            target: self,
            action: #selector(irCarroMarket(sender:))
        )
    }
    func configureSearchController(){
        searchController.loadViewIfNeeded()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.enablesReturnKeyAutomatically  = false
        searchController.searchBar.returnKeyType = UIReturnKeyType.done
        self.navigationItem.searchController = searchController
        self.navigationItem.hidesSearchBarWhenScrolling = false
        definesPresentationContext = true
        searchController.searchBar.placeholder = "Buscar por nombre"
    }
    
    // MARK: - Functions
    private func setupVM() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        webServicesMenu().getArticles() { articles in
            if let articles = articles {
                self.menuListVM = MenuListViewModel(productosMenu: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
   private func setUpTableView() {
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}

extension MenuViewController:  UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating, UISearchBarDelegate {
    // MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searching{
            return searchedMenu.count
        }else{
            return self.menuListVM == nil ? 0 : self.menuListVM.numberOfSections
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //startloading()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as? MenuTableViewCell else { return UITableViewCell() }
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.yellow
        cell.selectedBackgroundView = backgroundView
        
        if searching {
            let articleVM = searchedMenu[indexPath.row]
            let paths = String(searchedMenu[indexPath.row].image)
            cell.imgArrow.image = UIImage(named: "arrowpay")
            if let imageURL = URL(string:paths) {
                DispatchQueue.global().async { [self] in
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        DispatchQueue.main.async {
                            cell.imgMenu.image =  image
                            stoploading()
                        }
                    }
                }
            }
            cell.lblName.text = searchedMenu[indexPath.row].name
            cell.lbldescrip.text = searchedMenu[indexPath.row].desc
            cell.lblPrice.text = "$" + String(searchedMenu[indexPath.row].price)
        } else {
            let articleVM = self.menuListVM.articleAtIndex(indexPath.row)
            let paths = String(articleVM.productosMenu[indexPath.row].image)
            cell.imgArrow.image = UIImage(named: "arrowpay")
            DispatchQueue.main.async {
                cell.configure(MenuTableViewModel(name: articleVM.productosMenu[indexPath.row].name, title: articleVM.productosMenu[indexPath.row].desc, images: paths, precio: String(articleVM.productosMenu[indexPath.row].price)))
                self.stoploading()
            }
            
        }
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productoVM = self.menuListVM.articleAtIndex(indexPath.row)
        if searching {
            self.selectVC(item: itemTableViewModel(name: searchedMenu[indexPath.row].name, desc: searchedMenu[indexPath.row].desc, images: String(searchedMenu[indexPath.row].image), price: String(searchedMenu[indexPath.row].price), latitude: searchedMenu[indexPath.row].latitude, longitude: searchedMenu[indexPath.row].longitude))
            
        } else {
            self.selectVC(item: itemTableViewModel(name: productoVM.productosMenu[indexPath.row].name, desc: productoVM.productosMenu[indexPath.row].desc, images: String(productoVM.productosMenu[indexPath.row].image), price: String(productoVM.productosMenu[indexPath.row].price), latitude: productoVM.productosMenu[indexPath.row].latitude, longitude: productoVM.productosMenu[indexPath.row].longitude))
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = searchController.searchBar.text!
        if !searchText.isEmpty {
            searching = true
            searchedMenu.removeAll()
            for item in menuListVM.productosMenu {
                if item.desc.lowercased().contains(searchText.lowercased())
                {
                    searchedMenu.append(item)
                }
            }
        }else{
            searching = false
            searchedMenu.removeAll()
            searchedMenu = menuListVM.productosMenu
        }
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchedMenu.removeAll()
        tableView.reloadData()
    }
   
}
extension MenuViewController {
    private func startloading(){
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.gray
        loadingIndicator.startAnimating();
        alert.view.addSubview(loadingIndicator)
        self.present(alert, animated: true, completion: nil)
    }
    private func stoploading(){
        self.dismiss(animated: false, completion: nil)
    }
    func selectVC(item: itemTableViewModel) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "DetailsNewViewController") as! DetailsNewViewController
        storyboard.nombreString = item.name
        storyboard.imageString = String(item.images)
        storyboard.decripString = item.desc
        storyboard.precio = "$" + String(item.price)
        storyboard.latitud = item.latitude
        storyboard.lontitud = item.longitude
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    // MARK: - Actions
    @objc func irCarroMarket(sender: UIBarButtonItem) {
        //goToCarroMarket()
    }
}
