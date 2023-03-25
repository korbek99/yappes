//
//  DetailsViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit
class DetailsViewController: UIViewController {
    
    var nombreString:String?
    var decripString:String?
    var imageString:String?
    var precio:String?
    var latitud:String?
    var lontitud:String?
    
    // MARK: - IBOutlets
    lazy var viewAgregar: UIView = {
        let view: UIView = .init()
        view.backgroundColor = .yellow
        view.layer.cornerRadius = 25
        view.layer.borderWidth = 1
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewAgregarButton: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .orange
        button.setTitle("Agregar Carro", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(agregarCarroAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
   
    lazy var viewCloseOpen: UIButton = {
        let button: UIButton = .init()
        button.setImage(UIImage(named: "icArrowUp"), for: .normal)
        button.addTarget(self, action: #selector(openViewAction), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
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
        button.setImage(UIImage(named: "menucar"), for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpButtonMapa()
        setUpTableView()
        setUpTableViewregister()
        assignbackground()
        setUpViewAgregar()
    }

    // MARK: - Functions
    private func setUpViewAgregar() {
        setUpViewButtonAgregar()
        view.addSubview(viewAgregar)
       // viewAgregar.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        viewAgregar.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        viewAgregar.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        viewAgregar.bottomAnchor.constraint(equalTo: view.bottomAnchor,constant: 0.0).isActive = true
        viewAgregar.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    private func setUpViewButtonAgregar() {
        viewAgregar.addSubview(viewCloseOpen)
        viewAgregar.addSubview(viewAgregarButton)
        viewCloseOpen.topAnchor.constraint(equalTo: viewAgregar.topAnchor,constant: 10).isActive = true
        viewCloseOpen.leadingAnchor.constraint(equalTo: viewAgregar.leadingAnchor,constant: 100).isActive = true
        viewCloseOpen.trailingAnchor.constraint(equalTo: viewAgregar.trailingAnchor,constant: -100).isActive = true
        viewCloseOpen.heightAnchor.constraint(equalToConstant: 20).isActive = true
        viewCloseOpen.widthAnchor.constraint(equalToConstant: 30).isActive = true
        
        //viewAgregarButton.topAnchor.constraint(equalTo: viewAgregar.topAnchor,constant: 10).isActive = true
        viewAgregarButton.leadingAnchor.constraint(equalTo: viewAgregar.leadingAnchor,constant: 20).isActive = true
        viewAgregarButton.trailingAnchor.constraint(equalTo: viewAgregar.trailingAnchor,constant: -20).isActive = true
        viewAgregarButton.bottomAnchor.constraint(equalTo: viewAgregar.bottomAnchor,constant: -50).isActive = true
        viewAgregarButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    func assignbackground(){
           let background = UIImage(named: "on-boarding-background-2")

           var imageView : UIImageView!
           imageView = UIImageView(frame: view.bounds)
        imageView.contentMode =  UIView.ContentMode.scaleAspectFill
           imageView.clipsToBounds = true
           imageView.image = background
           imageView.center = view.center
           view.addSubview(imageView)
           self.view.sendSubviewToBack(imageView)
       }
    private func setUpButtonMapa() {
        let buttonIcon = UIImage(named: "menucar")
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: buttonIcon,
            style: .plain,
            target: self,
            action: #selector(irMapaMarket(sender:))
        )
    }
    private func setUpTableViewregister() {
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
    private func goToMapaView(){
        let storyboard = self.storyboard?.instantiateViewController(identifier: "MapiViewController") as! MapiViewController
        storyboard.latitudMap = latitud
        storyboard.lontitudMap = lontitud
        storyboard.lugarString = nombreString
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    // MARK: - Actions
    @objc func irMapaMarket(sender: UIBarButtonItem) {
        goToMapaView()
    }
    @objc func irMapaMarketCell(sender: UIButton) {
        goToMapaView()
    }
    @objc func agregarCarroAction(){
        print("agregarCarroAction")
    }
    @objc func openViewAction(){
        print("openViewAction")
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
            let backgroundView = UIView()
            backgroundView.backgroundColor = UIColor.white
            cell.selectedBackgroundView = backgroundView
            cell.heightAnchor.constraint(equalToConstant: 200.0).isActive = true
            
            cell.configure(HeaderTableViewModel(name: String(nombreString!), title: String(decripString!), precio: String(precio!)))
                    return cell
                }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "BodyTableViewCell") as! BodyTableViewCell
            cell.heightAnchor.constraint(equalToConstant: 380.0).isActive = true
            cell.isUserInteractionEnabled = false
            cell.configure(BodyTableViewModel(urlImg: imageString!))
           
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FooterTableViewCell") as! FooterTableViewCell
            cell.isUserInteractionEnabled = false
            cell.heightAnchor.constraint(equalToConstant: 120.0).isActive = true
            return cell
        }
    }
}
