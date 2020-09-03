import Vapor
import Leaf
import Fluent
import FluentPostgresDriver

// configures your application
public func configure(_ app: Application) throws {
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // register routes
    try routes(app)
    //app.leaf.configuration = LeafConfiguration(rootDirectory: "/Users/jrork1/Documents/xcode/tryLeafWithBootstrap")
    app.views.use(.leaf)

    app.databases.use(.postgres(hostname: "localhost", username: "vapor", password: "vapor", database: "vapor"), as: .psql)
    app.migrations.add(Endpoint.CreateEndpoint())
}
