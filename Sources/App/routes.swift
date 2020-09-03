import Vapor
import Leaf

func routes(_ app: Application) throws {
    app.get { req -> EventLoopFuture<View> in
        return Endpoint.query(on: req.db).all().flatMap {
            endpoints in
                return req.view.render("index", ["endpoints": endpoints])
        }
    }

    app.post("add") { req -> EventLoopFuture<Response> in
        let data = try req.content.decode(Endpoint.self)
        return data.create(on: req.db).map { data in
            return req.redirect(to: "/")
        }
    }
    
    app.get("endpoints") { req -> EventLoopFuture<[Endpoint]> in
        return Endpoint.query(on: req.db).all()
    }
}
 
 
