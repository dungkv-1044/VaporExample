import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "It works" example
    router.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }
    
    router.get("demo") { req in
        return "Dung"
    }
    let todoController = TodoController()
    router.get("kim", String.parameter, use: todoController.greet)
    // Example of configuring a controller
    
    router.get("todos", use: todoController.index)
    router.post("todos", use: todoController.create)
    router.delete("todos", Todo.parameter, use: todoController.delete)
    
    
    //
    router.post("login") { req -> Future<HTTPStatus> in
        return try req.content.decode(User.self).map(to: HTTPStatus.self) { user in
            print(user.email) // user@vapor.codes
            print(user.name) // don't look!
            if user.email == "email@gmail.com" {
                return .ok
            } else {
                return .badRequest
            }
        }
    }
    
    router.post("login2") { req -> Future<Callback> in
        return try req.content.decode(User.self).map(to: Callback.self) { user in
            if user.email == "email@gmail.com" {
                return Callback(message: "Success", statusCode: HTTPStatus.ok.code)
            } else {
                return Callback(message: "Incorrect email address!", statusCode: HTTPStatus.badRequest.code)
            }
        }
    }
    
    router.get("user") { req -> User in
        return User(email: "email@gmail.com", name: "Demo USer")
    }
    
    
}
