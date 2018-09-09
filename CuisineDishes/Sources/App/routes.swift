import Vapor

public func routes(_ router: Router) throws {
    router.post(Dish.self, at: "api/dish") { 
        (request: Request, dish: Dish) -> ApiResponse in
        var dishMutable = dish
        dishMutable.id = 001
        
        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"

        return ApiResponse(links: links, dishes: [dishMutable])
    }
    
    router.post(Dish.self, at: "api/dish-future") { 
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
    
    router.post(Dish.self, at: "api/dish-generic") { 
        (request: Request, dish: Dish) -> ApiResponseGeneric<[Dish]> in
        var dishMutable = dish
        dishMutable.id = 003
        
        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"
        
        return ApiResponseGeneric<[Dish]>(links: links, data: [dishMutable])
    }
    
    router.post(Dish.self, at: "api/dish-generic-future") { 
        (request: Request, dish: Dish) -> Future<ApiResponseGeneric<[Dish]>> in
        var dishMutable = dish
        dishMutable.id = 004
        
        var links = Links()
        links.current = "http://example.com"
        links.next = "http://example.com"
        links.last = "http://example.com"
        
        return Future.map(on: request, { 
            () -> ApiResponseGeneric<[Dish]> in
            return ApiResponseGeneric<[Dish]>(links: links, data: [dishMutable])
        }) 
    }

    ////// Using 'Content' as a concrete type conforming to protocol 'Content' is not supported
    //router.post(Dish.self, at: "api/dish-generic") { 
    //    (request: Request, dish: Dish) -> Content in
    //    var dishMutable = dish
    //    dishMutable.id = 005
    //    
    //    var links = Links()
    //    links.current = "http://example.com"
    //    links.next = "http://example.com"
    //    links.last = "http://example.com"
    //    
    //    let response = ApiResponseGeneric<[Dish]>(links: links, data: [dishMutable])
    //    
    //    return response as Content
    //}
    
}
