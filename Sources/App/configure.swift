import Vapor
import FluentPostgresDriver
import Fluent
// configures your application
public func configure(_ app: Application) async throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    
    app.http.server.configuration.port = 8081
    app.databases.use(.postgres(configuration: SQLPostgresConfiguration(hostname: "localhost", username: "myuser", password: "mypassword", database: "grocerydb", tls: .prefer(try .init(configuration: .clientDefault)))), as: .psql)
    
    // register migrations
    app.migrations.add(CreateUsersTableMigration())
    app.migrations.add(CreateGroceryCategoryTableMigration())
    app.migrations.add(CreateGroceryItemTableMigration())
        
    // register the controllers
    try app.register(collection: UserController())
    try app.register(collection: GroceryController())
    
    app.jwt.signers.use(.hs256(key: Environment.get("JWT_SIGN_KEY") ?? "SECRETKEY"))
    
    
    try routes(app)
}
