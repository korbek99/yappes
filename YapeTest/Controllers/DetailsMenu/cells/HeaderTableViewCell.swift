//
//  HeaderTableViewCell.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit

class HeaderTableViewCell: UITableViewCell {
    override func prepareForReuse() {
    }
    // MARK: - IBOutlets
    lazy var imgStoreIcon: UIImageView = {
        let image: UIImageView = .init()
        image.contentMode = .scaleAspectFit
        image.layer.masksToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configLabels()
        setupUIUX()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(imgStoreIcon)
        addSubview(lblNameDetail)
        addSubview(lblTitleDetail)
        addSubview(lblPriceDetail)
        
        imgStoreIcon.topAnchor.constraint(equalTo: topAnchor, constant: 20).isActive = true
        imgStoreIcon.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        imgStoreIcon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        imgStoreIcon.widthAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblNameDetail.topAnchor.constraint(equalTo: topAnchor, constant: 22).isActive = true
        lblNameDetail.leadingAnchor.constraint(equalTo: imgStoreIcon.trailingAnchor, constant: 15).isActive = true
        lblNameDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        lblNameDetail.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        lblTitleDetail.topAnchor.constraint(equalTo: lblNameDetail.bottomAnchor, constant: 10).isActive = true
        lblTitleDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        lblTitleDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true

        lblTitleDetail.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        lblPriceDetail.topAnchor.constraint(equalTo: lblTitleDetail.bottomAnchor, constant: 20).isActive = true
        lblPriceDetail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        lblPriceDetail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30).isActive = true
        lblPriceDetail.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
    }
    func configLabels() {
       // lblNameDetail.font = UIFont.systemFont(ofSize: 35.0)
        lblNameDetail.font = UIFont.boldSystemFont(ofSize: 35.0)
        lblNameDetail.textColor = UIColor.black
        lblNameDetail.numberOfLines = 0
        
        lblTitleDetail.font = UIFont.systemFont(ofSize: 20.0)
        lblTitleDetail.textColor = UIColor.gray
        lblTitleDetail.numberOfLines = 0
        
        //lblPriceDetail.font =  UIFont.systemFont(ofSize: 25.0)
        lblPriceDetail.font = UIFont.boldSystemFont(ofSize: 25.0)
        lblPriceDetail.textColor = UIColor.orange
        lblPriceDetail.numberOfLines = 0
     
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
