//
//  File.swift
//  
//
//  Created by abdul ahad on 5/5/23.
//

import Foundation
import Fluent

struct CreateUsersTableMigration: AsyncMigration {
    
    func prepare(on database: Database) async throws {
        try await database.schema("users")
            .id()
            .field("username", .string, .required).unique(on: "username")
            .field("password", .string, .required)
            .create()
    }
    
    // UNDO
    func revert(on database: Database) async throws {
        try await database.schema("users")
            .delete()
    }
}
