import Vapor

struct Dish: Content {
    var id: Int?
    var title: String
    var description: String
    var course: String
    var price: Double
    
    init(id: Int? = nil, title: String, description: String, course: String, price: Double) {
        self.id = id
        self.title = title
        self.description = description
        self.course = course
        self.price = price
    }
}

struct Links: Content {
    var current: String?
    var next: String?
    var last: String?
}

struct ApiResponse: Content {
    var links: Links?
    var dishes: [Dish]
    
    init(links: Links, dishes: [Dish]) {
        self.links = links
        self.dishes = dishes
    }
}
