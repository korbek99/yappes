//
//  webServicesMenu.swift
//  YapeTest
//
//  Created by Jose David Bustos H on 17-02-23.
//

import Foundation
import UIKit
class webServicesMenu {
    
    func getArticles( completion: @escaping ([Product]?) -> ()) {
        
        let url = URL(string: "http://demo3724643.mockable.io/")!
        
        URLSession.shared.dataTask(with: url) { [self] data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
                
            } else if let data = data {
              
                let articleList = try? JSONDecoder().decode(ProductosList.self, from: data)
                
                if let articleList = articleList?.products {
                   
                    completion(articleList)
                }
                
                print(articleList?.products)
                
            }
            
        }.resume()
        
    }
    

    
}
