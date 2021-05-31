import Fluent
import Vapor

public func routes(_ app: Application) throws {
    
    // POST: api/dish
    app.post("api", "dish") { (request: Request) -> ApiResponse in
        var dishMutable = try request.content.decode(Dish.self)
        dishMutable.id = 001
        print(dishMutable)

        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"

        return ApiResponse(links: links, dishes: [dishMutable])
    }

    // :TBD: needs updating for Vapor 4
    //app.post("api", "dish-future") {
    //    (request: Request) -> EventLoopFuture<ApiResponse> in
    //    var dishMutable = try request.content.decode(Dish.self)
    //    dishMutable.id = 002
    //
    //    var links = Links()
    //    links.current = "http://example.com"
    //    links.next = "http://example.com"
    //    links.last = "http://example.com"
    //
    //    return EventLoopFuture.map({
    //        () -> ApiResponse in
    //        return ApiResponse(links: links, dishes: [dishMutable])
    //    })
    //}

    app.post("api/dish-generic") {
        (request: Request) -> ApiResponseGeneric<[Dish]> in
        var dishMutable = try request.content.decode(Dish.self)
        dishMutable.id = 003

        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"

        return ApiResponseGeneric<[Dish]>(links: links, data: [dishMutable])
    }

    // :TBD: needs updating for Vapor 4
    //app.post(Dish.self, at: "api/dish-generic-future") {
    //    (request: Request, dish: Dish) -> EventLoopFuture<ApiResponseGeneric<[Dish]>> in
    //    var dishMutable = try request.content.decode(Dish.self)
    //    dishMutable.id = 004
    //
    //    var links = Links()
    //    links.current = "http://example.com"
    //    links.next = "http://example.com"
    //    links.last = "http://example.com"
    //
    //    return EventLoopFuture.map(on: request, {
    //        () -> ApiResponseGeneric<[Dish]> in
    //        return ApiResponseGeneric<[Dish]>(links: links, data: [dishMutable])
    //    })
    //}
    
}
