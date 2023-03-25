//
//  DetailsNewViewController.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 25-03-23.
//

import UIKit

class DetailsNewViewController: UIViewController {

    var nombreString:String?
    var decripString:String?
    var imageString:String?
    var precio:String?
    var latitud:String?
    var lontitud:String?
    
    lazy var imgStoreIcon: UIImageView = {
        let images: UIImageView = .init()
        images.image = UIImage(named: "tienda")
        images.contentMode = .scaleAspectFit
        images.layer.masksToBounds = true
        images.translatesAutoresizingMaskIntoConstraints = false
        return images
    }()
    lazy var lblNameDetail: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lblTitleDetail: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lblPriceDetail: UILabel = {
        let label: UILabel = .init()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imgMenuDetail: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 20.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    lazy var btnVerMapas: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .white
        button.setTitle("Ver Mapa", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(irMapaMarketCell), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    lazy var viewHeader: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewBody: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewFooter: UIView = {
        let view: UIView = .init()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var viewPrice: UIView = {
        let view: UIView = .init()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var stackView: UIStackView = {
        let stackView: UIStackView = .init()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.addArrangedSubview(viewHeader)
        stackView.addArrangedSubview(viewBody)
        stackView.addArrangedSubview(viewFooter)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    lazy var scrollView: UIScrollView = {
        let scrollview: UIScrollView = .init()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configLabels()
        setupViewPrice()
        setupHeader()
        setupBody()
        setupFooter()
        setupUX()
    }
    func setupViewPrice(){
        viewPrice.backgroundColor = .green
        viewPrice.addSubview(lblPriceDetail)
        lblPriceDetail.topAnchor.constraint(equalTo: viewPrice.topAnchor, constant: 1).isActive = true
        lblPriceDetail.leadingAnchor.constraint(equalTo: viewPrice.leadingAnchor, constant: 5).isActive = true
    }
    func setupHeader(){
        self.viewHeader.backgroundColor = .white
        viewHeader.heightAnchor.constraint(equalToConstant: 250).isActive = true
        viewHeader.addSubview(imgStoreIcon)
        viewHeader.addSubview(lblNameDetail)
        viewHeader.addSubview(lblTitleDetail)
        viewHeader.addSubview(btnVerMapas)
        viewHeader.addSubview(viewPrice)

        imgStoreIcon.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 100).isActive = true
        imgStoreIcon.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 30).isActive = true
        imgStoreIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imgStoreIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblNameDetail.topAnchor.constraint(equalTo: viewHeader.topAnchor, constant: 100).isActive = true
        lblNameDetail.leadingAnchor.constraint(equalTo: imgStoreIcon.trailingAnchor, constant: 15).isActive = true
        lblNameDetail.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -10).isActive = true
        lblNameDetail.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        
        
        lblTitleDetail.topAnchor.constraint(equalTo: lblNameDetail.bottomAnchor, constant: 10).isActive = true
        lblTitleDetail.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 30).isActive = true
        lblTitleDetail.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -10).isActive = true

        lblTitleDetail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        viewPrice.topAnchor.constraint(equalTo: lblTitleDetail.bottomAnchor, constant: 20).isActive = true
        viewPrice.leadingAnchor.constraint(equalTo: viewHeader.leadingAnchor, constant: 30).isActive = true
        viewPrice.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewPrice.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        btnVerMapas.topAnchor.constraint(equalTo: lblTitleDetail.bottomAnchor, constant: 20).isActive = true
        btnVerMapas.trailingAnchor.constraint(equalTo: viewHeader.trailingAnchor, constant: -15).isActive = true
        btnVerMapas.heightAnchor.constraint(equalToConstant: 30).isActive = true
        btnVerMapas.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    func setupBody(){
        self.viewBody.backgroundColor = .white
        viewBody.heightAnchor.constraint(equalToConstant: 350).isActive = true
        viewBody.addSubview(imgMenuDetail)
        
        imgMenuDetail.topAnchor.constraint(equalTo: viewBody.topAnchor, constant: 5).isActive = true
        imgMenuDetail.leadingAnchor.constraint(equalTo: viewBody.leadingAnchor, constant: 15).isActive = true
        imgMenuDetail.trailingAnchor.constraint(equalTo: viewBody.trailingAnchor, constant: -15).isActive = true
        imgMenuDetail.bottomAnchor.constraint(equalTo: viewBody.bottomAnchor, constant: 5).isActive = true
        imgMenuDetail.heightAnchor.constraint(equalToConstant: 250).isActive = true
        imgMenuDetail.widthAnchor.constraint(equalToConstant: 250).isActive = true
    }
    func setupFooter(){
        self.viewFooter.backgroundColor = .white
        viewFooter.heightAnchor.constraint(equalToConstant: 150).isActive = true
    }
    func setupUX(){
        view.addSubview(scrollView)
        view.addSubview(stackView)
        let safeAreaInset = UIApplication.shared.windows.first?.safeAreaInsets

    scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
    scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
    scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        
    stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
    stackView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
    scrollView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: -(safeAreaInset?.top ?? 0.0)).isActive = true
    scrollView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -(safeAreaInset?.top ?? 0.0)).isActive = true
        
    }

}
extension DetailsNewViewController {
    // MARK: - Actions
    @objc func irMapaMarket(sender: UIBarButtonItem) {
        goToMapaView()
    }
    @objc func irMapaMarketCell(sender: UIButton) {
        goToMapaView()
    }
    private func goToMapaView(){
        let storyboard = self.storyboard?.instantiateViewController(identifier: "MapiViewController") as! MapiViewController
        storyboard.latitudMap = latitud
        storyboard.lontitudMap = lontitud
        storyboard.lugarString = nombreString
        self.navigationController?.pushViewController(storyboard, animated: true)
    }
    
    func configLabels(){
        lblNameDetail.text = nombreString
        lblNameDetail.font = UIFont.boldSystemFont(ofSize: 35.0)
        lblNameDetail.textColor = UIColor.black
        lblNameDetail.numberOfLines = 0
        
        lblTitleDetail.text = decripString
        lblTitleDetail.font = UIFont.systemFont(ofSize: 20.0)
        lblTitleDetail.textColor = UIColor.gray
        lblTitleDetail.numberOfLines = 0
        
        lblPriceDetail.text = precio
        lblPriceDetail.font = UIFont.boldSystemFont(ofSize: 25.0)
        lblPriceDetail.textColor = UIColor.white
        lblPriceDetail.numberOfLines = 0
        
        if let imageURL = URL(string: imageString!) {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    imgMenuDetail.image =  image
                }
        }
    }
}
