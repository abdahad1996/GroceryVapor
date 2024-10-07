//
//  File.swift
//  
//
//  Created by abdul ahad on 5/11/23.
//

import Foundation
import Vapor

struct JSONWebTokenAuthenticator: AsyncRequestAuthenticator {
    
    func authenticate(request: Request) async throws {
        try request.jwt.verify(as: AuthPayload.self) 
    }
    
}
