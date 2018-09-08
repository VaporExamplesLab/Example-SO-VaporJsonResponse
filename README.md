# Example-SO-VaporJsonResponse

`Example-SO-VaporJsonResponse` provides a working example for the StackOverflow question ["Making Vapor API response JSON API Spec compliant"](https://stackoverflow.com/questions/52232746/making-vapor-api-response-json-api-spec-compliant).


Each `class` and/or `struct` in the compound object `ApiResponse` needs to comply with the `Content` protocol. The `Content` protocol includes the `Codable` protocol for JSON decoding and encoding. 

The post has be check with the [RESTed](https://itunes.apple.com/us/app/rested-simple-http-requests/id421879749) macOS application using the file ["Dish.request"](Dish.request).

