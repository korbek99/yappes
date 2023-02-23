//
//  DetailsViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit

class DetailsViewController: UIViewController {

    // MARK: - IBOutlets
    lazy var tableView: UITableView = {
        let table: UITableView = .init()
        table.delegate = self
        table.dataSource = self
        table.separatorColor = UIColor.orange
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    lazy var btnVerMapas: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .blue
        button.setTitle("Ver Mapa", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    var nombreString:String?
    var decripString:String?
    var imageString:String?
    var precio:String?
    var latitud:String?
    var lontitud:String?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonMapa()
        setUpTableView()
        setUpTableViewregister()
    }

    // MARK: - Functions
    private func setUpButtonMapa() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Ir a Mapa",
            style: .plain,
            target: self,
            action: #selector(irMapaMarket(sender:))
        )
    }
    func setUpTableViewregister() {
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.register(HeaderTableViewCell.self, forCellReuseIdentifier: "HeaderTableViewCell")
        tableView.register(BodyTableViewCell.self, forCellReuseIdentifier: "BodyTableViewCell")
        tableView.register(FooterTableViewCell.self, forCellReuseIdentifier: "FooterTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
    private func setUpTableView() {
         view.addSubview(tableView)
         tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
     }

}

extension DetailsViewController:  UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
            return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderTableViewCell") as! HeaderTableViewCell
                    cell.imgStoreIcon.image = UIImage(named: "tienda")
                    cell.isUserInteractionEnabled = false
                    cell.lblNameDetail.text =  String(nombreString!)
                    cell.lblTitleDetail.text = String(decripString!)
                    cell.lblPriceDetail.text = "Precio : " + String(precio!)
                    cell.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
                    return cell
                }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell") as! BodyTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 280.0).isActive = true
            cell.isUserInteractionEnabled = false
            if let imageURL = URL(string:imageString!) {
                print(imageURL)
                    let data = try? Data(contentsOf: imageURL)
                    if let data = data {
                        let image = UIImage(data: data)
                        cell.imgMenuDetail.image =  image
                    }
            }
           
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell") as! FooterTableViewCell
            cell.isUserInteractionEnabled = false
            cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            return cell
        }
    }
  
    // MARK: - Actions 
    @objc func irMapaMarket(sender: UIBarButtonItem) {
        let storyboard = self.storyboard?.instantiateViewController(identifier: "MapViewController") as! MapViewController
        storyboard.latitudMap = latitud
        storyboard.lontitudMap = lontitud
        storyboard.lugarString = nombreString
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
}
