import Foundation


struct Person {
    let name: String
    let age: Int
}

let me = Person(name: "udev", age: 27)

me.age
me.name


struct CommodorComputer {
    let name: String
    let manufacturer: String
    // Modify constructor
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

let c64 = CommodorComputer(name: "C64")
c64.name
c64.manufacturer

struct PersonV2 {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
        // return "\(firstName) \(lastName)"
    }
//    init(firstName: String, lastName: String) {
//        self.firstName = firstName
//        self.lastName = lastName
//        self.fullName = "\(firstName) \(lastName)"
//    }
}

let me2 = PersonV2(firstName: "fa", lastName: "sal")
me2.firstName
me2.lastName
me2.fullName


struct Car {
    var currentSpeed: Int
    mutating func drive(speed: Int){
        currentSpeed = speed
    }
}

//let immutableCar = Car(currentSpeed: 10)
var mutableCar = Car(currentSpeed: 10)
mutableCar.drive(speed: 2)
mutableCar.currentSpeed

// Copy
let copy = mutableCar
//copy.drive(speed: 67)
copy.currentSpeed


struct LivingThink {
    let oxygenConsumption: Int
}
// Structure can't be inharited
//struct Animal : LivingThink {
//    
//}


// Copy with custom logic
struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike {
        return Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
let bike2 = bike1.copy(currentSpeed: 50)
bike1.currentSpeed
bike2.currentSpeed

