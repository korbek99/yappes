//
//  MenuListViewModel.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import Foundation

struct MenuListViewModel {
    let productosMenu: [Product]
}

extension MenuListViewModel {
    
    var numberOfSections: Int {
        return self.productosMenu.count
    }
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.productosMenu.count
    }
    func articleAtIndex(_ index: Int) -> MenuListViewModel {
        let article = self.productosMenu[index]
        return MenuListViewModel(productosMenu: productosMenu)
    }
    
}

struct MenuViewModel {
    private let article: Product
}

extension MenuViewModel {
    init(_ article: Product) {
        self.article = article
    }
}

extension MenuViewModel {
    var ide: String {
        return self.article.id
    }
    var description: String {
        return self.article.desc
    }
    
    var precio: Int {
        return self.article.price
    }
    var latitude: String {
        return self.article.latitude
    }
    
    var longitude: String {
        return self.article.longitude
    }
}
