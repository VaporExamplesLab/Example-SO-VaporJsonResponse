import Fluent
import FluentSQLiteDriver
import Vapor

/// Called before your application initializes.
public func configure(_ app: Application) throws {
    // -- Register Middleware
    // -- uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

    // -- Configure SQLite Database
    app.databases.use(.sqlite(.memory), as: .sqlite)
    //app.databases.use(.sqlite(.file("db.sqlite")), as: .sqlite)

    // -- Configure Migrations
    //app.migrations.add(Dish())

    // -- Register Routes
    try routes(app)
}
