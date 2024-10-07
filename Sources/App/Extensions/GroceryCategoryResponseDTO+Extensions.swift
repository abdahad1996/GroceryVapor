//
//  File.swift
//  
//
//  Created by abdul ahad on 5/9/23.
//

import Foundation
import GrocerySharedDTO

import Vapor

extension GroceryCategoryResponseDTO: Content {
    
    init?(_ groceryCategory: GroceryCategory) {
        
        guard let id = groceryCategory.id
        else {
            return nil
        }
        
        self.init(id: id, title: groceryCategory.title, colorCode: groceryCategory.colorCode)
    }
    
}
