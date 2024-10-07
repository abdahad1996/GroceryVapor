//
//  File.swift
//  
//
//  Created by abdul ahad on 5/10/23.
//

import Foundation
import Vapor
import GrocerySharedDTO

extension GroceryItemResponseDTO: Content {
    
    init?(_ groceryItem: GroceryItem) {
        
        guard let groceryItemId = groceryItem.id else {
                return nil
        }
        
        self.init(id: groceryItemId, title: groceryItem.title, price: groceryItem.price, quantity: groceryItem.quantity)
    }
    
}
