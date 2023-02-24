//
//  MenuViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit
class MenuViewController: UIViewController {

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
    private var menuListVM: MenuListViewModel!
    
    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        startloading()
        view.backgroundColor = UIColor.white
        setUpTableView()
        setupVM()
      
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
}

extension MenuViewController:  UITableViewDelegate, UITableViewDataSource {
    // MARK: - tableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuListVM == nil ? 0 : self.menuListVM.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        startloading()
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MenuTableViewCell") as? MenuTableViewCell else { return UITableViewCell() }
        
        let articleVM = self.menuListVM.articleAtIndex(indexPath.row)
        let paths = String(articleVM.productosMenu[indexPath.row].image)
        
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
  
        cell.lblName.text = articleVM.productosMenu[indexPath.row].name
        cell.lbldescrip.text = articleVM.productosMenu[indexPath.row].desc
        cell.lblPrice.text = "$" + String(articleVM.productosMenu[indexPath.row].price)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productoVM = self.menuListVM.articleAtIndex(indexPath.row)
        let storyboard = self.storyboard?.instantiateViewController(identifier: "DetailsViewController") as! DetailsViewController
        storyboard.nombreString = productoVM.productosMenu[indexPath.row].name
        storyboard.imageString = String(productoVM.productosMenu[indexPath.row].image)
        storyboard.decripString = productoVM.productosMenu[indexPath.row].desc
        storyboard.precio = "$" + String(productoVM.productosMenu[indexPath.row].price)
        storyboard.latitud = productoVM.productosMenu[indexPath.row].latitude
        storyboard.lontitud = productoVM.productosMenu[indexPath.row].longitude
        
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
   
}
