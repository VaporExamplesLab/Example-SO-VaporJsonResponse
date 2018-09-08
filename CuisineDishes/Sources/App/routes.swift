import Vapor

public func routes(_ router: Router) throws {
    router.post(Dish.self, at: "api/dish1") { 
        (request: Request, dish: Dish) -> ApiResponse in
        var dishMutable = dish
        dishMutable.id = 001
        
        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"

        return ApiResponse(links: links, dishes: [dishMutable])
    }
    
    router.post(Dish.self, at: "api/dish2") { 
        (request: Request, dish: Dish) -> Future<ApiResponse> in
        var dishMutable = dish
        dishMutable.id = 002
        
        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"
        
        return Future.map(on: request, { 
            () -> ApiResponse in
            return ApiResponse(links: links, dishes: [dishMutable])
        }) 
    }

}
