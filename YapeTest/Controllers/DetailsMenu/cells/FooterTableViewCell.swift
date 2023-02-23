//
//  FooterTableViewCell.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import UIKit

class FooterTableViewCell: UITableViewCell {
    override func prepareForReuse() {
    }
    // MARK: - IBOutlets
    lazy var btnContinuar: UIButton = {
        let button: UIButton = .init()
        button.backgroundColor = .white
        button.setTitle("Continuar", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 25
        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configButton()
        setupUIUX()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Functions
    func configButton(){
        
    }
    func setupUIUX() {
        self.backgroundColor = .white
        addSubview(btnContinuar)
        btnContinuar.topAnchor.constraint(equalTo: topAnchor, constant: 30).isActive = true
        btnContinuar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15).isActive = true
        btnContinuar.heightAnchor.constraint(equalToConstant: 50).isActive = true
        btnContinuar.widthAnchor.constraint(equalToConstant: 150).isActive = true
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
