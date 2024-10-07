//
//  File.swift
//  
//
//  Created by abdul ahad on 5/8/23.
//

import Foundation
import Fluent

class CreateGroceryCategoryTableMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("grocery_categories")
            .id()
            .field("title", .string, .required)
            .field("color_code", .string, .required)
            .field("user_id", .uuid, .required, .references("users", "id"))
            .create()
    }
    
    func revert(on database: Database) async throws {
        try await database.schema("grocery_categories")
            .delete()
    }
    
}
