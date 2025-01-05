import Foundation

// Similar to interfaces
protocol CanBreathe {
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        "Breathe O2"
    }
}

struct Person: CanBreathe {
    func breathe(){
        "Breath O2 heavily"
    }
}

let dog = Animal()
dog.breathe()
let me = Person()
me.breathe()

protocol CanJump {
    func jump()
}

// Default implementation
//extension CanJump {
//    func jump(){
//        "Jumping..."
//    }
//}

struct Cat: CanJump{
    func jump() {
        "I'm jumping brah"
    }
}

let whiskers = Cat()
whiskers.jump()


protocol HasName {
    var name: String {get}
    var age: Int {get set}
}

struct Dog: HasName {
    let name: String
    var age: Int
}

let woof = Dog(name: "woof", age: 10)
//woof.age += 1
woof.age
woof.name
