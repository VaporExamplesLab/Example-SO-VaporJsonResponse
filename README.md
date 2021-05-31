# Example-SO-VaporJsonResponse

`Example-SO-VaporJsonResponse` provides a working example for the StackOverflow question ["Making Vapor API response JSON API Spec compliant"](https://stackoverflow.com/questions/52232746/making-vapor-api-response-json-api-spec-compliant).

Each `class` and/or `struct` in the compound object `ApiResponse` complies with the `Content` protocol. The `Content` protocol includes the `Codable` protocol for JSON decoding and encoding. 

The `POST` was checked with the [RESTed](https://apps.apple.com/us/app/rested-simple-http-requests/id421879749) macOS application using the file ["Dish.request"](Dish.request).

``` sh
curl -i -X POST "http://127.0.0.1:8080/api/dish" \
    -H "Content-Type: application/json" \
    -d '{"course": "salad", \
        "description": "flavorful Southwestern ethos", \
        "price": 1.82, "title": "Aztec Salad"}'
```