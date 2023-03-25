//
//  MenuTableViewCell.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit
struct MenuTableViewModel {
    let name: String
    let title: String
    let images: String
    let precio: String
    init(name: String, title: String, images: String, precio: String) {
        self.name = name
        self.title = title
        self.images = images
        self.precio = precio
    }
}
class MenuTableViewCell: UITableViewCell {

    override func prepareForReuse() {
    }
    lazy var viewPrice: UIView = {
        let view: UIView = .init()
        view.layer.cornerRadius = 5.0
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    lazy var lblName: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lbldescrip: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    lazy var lblPrice: UILabel = {
        let label: UILabel = .init()
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var imgMenu: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15.0
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var imgArrow: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configLabels()
        setupUIUX()
        setupViewPrice()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ model: MenuTableViewModel) {
        if let imageURL = URL(string:model.images) {
            DispatchQueue.global().async { [self] in
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        imgMenu.image =  image
                    }
                }
            }
        }
        lblName.text = model.name
        lbldescrip.text = model.title
        lblPrice.text = "$" + model.precio
    }
    func setupViewPrice(){
        viewPrice.backgroundColor = .green
        viewPrice.addSubview(lblPrice)
        lblPrice.topAnchor.constraint(equalTo: viewPrice.topAnchor, constant: 1).isActive = true
        lblPrice.leadingAnchor.constraint(equalTo: viewPrice.leadingAnchor, constant: 5).isActive = true
    }
    func configLabels() {
        
        lblName.font = UIFont.boldSystemFont(ofSize: 20.0)
        lblName.textColor = UIColor.black
        lblName.numberOfLines = 0
        
        lbldescrip.font = UIFont.systemFont(ofSize: 15.0)
        lbldescrip.textColor = UIColor.gray
        lbldescrip.numberOfLines = 0
        
        lblPrice.font = UIFont.boldSystemFont(ofSize: 25.0)
        lblPrice.textColor = UIColor.white
        lblPrice.numberOfLines = 0
     
    }
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(lblName)
        addSubview(lbldescrip)
        addSubview(lblPrice)
        addSubview(imgMenu)
        addSubview(imgArrow)
        addSubview(viewPrice)
        
        imgMenu.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        imgMenu.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        imgMenu.heightAnchor.constraint(equalToConstant: 150).isActive = true
        imgMenu.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        lblName.topAnchor.constraint(equalTo: topAnchor, constant: 15).isActive = true
        lblName.leadingAnchor.constraint(equalTo: imgMenu.trailingAnchor, constant: 10).isActive = true
        lblName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lblName.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        lbldescrip.topAnchor.constraint(equalTo: lblName.bottomAnchor, constant: 10).isActive = true
        lbldescrip.leadingAnchor.constraint(equalTo: imgMenu.trailingAnchor, constant: 10).isActive = true
        lbldescrip.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lbldescrip.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
//        lblPrice.topAnchor.constraint(equalTo: lbldescrip.bottomAnchor, constant: 10).isActive = true
//        lblPrice.leadingAnchor.constraint(equalTo: imgMenu.trailingAnchor, constant: 10).isActive = true
//        lblPrice.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        viewPrice.topAnchor.constraint(equalTo: lbldescrip.bottomAnchor, constant: 10).isActive = true
        viewPrice.leadingAnchor.constraint(equalTo: imgMenu.trailingAnchor, constant: 10).isActive = true
        viewPrice.heightAnchor.constraint(equalToConstant: 30).isActive = true
        viewPrice.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        imgArrow.topAnchor.constraint(equalTo: topAnchor, constant: 90).isActive = true
        imgArrow.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        imgArrow.heightAnchor.constraint(equalToConstant: 20).isActive = true
        imgArrow.widthAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
