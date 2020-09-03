//
//  File.swift
//  
//
//  Created by Joseph Rork on 9/2/20.
//

import Foundation
import Vapor
import FluentPostgresDriver
import Fluent

final class Endpoint: Model, Content {
    
    static let schema = "endpoints"
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "name")
    var name: String
    
    @Field(key: "url")
    var url: String
    
    init() {}
    
    init(id: UUID? = nil, name: String, url: String) {
        self.id = id
        self.name = name
        self.url = url
    }
    
    struct CreateEndpoint: Migration {
        func prepare(on database: Database) -> EventLoopFuture<Void> {
            database.schema(Endpoint.schema)
                .id()
                .field("name", .string, .required)
                .field("url", .string, .required)
                .create()
        }
        
        func revert(on database: Database) -> EventLoopFuture<Void> {
            return database.schema(Endpoint.schema).delete()
        }
    }
}
