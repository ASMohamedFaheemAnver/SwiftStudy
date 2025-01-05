import Foundation


class Person {
    var name: String
    var age: Int
    // Constructor
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    
    func increaseAge(){
        self.age += 1
    }
}

let me = Person(name: "udev", age: 27)
me.increaseAge()
me.age

// Copying reference this is why both will change
let meCopy = me
meCopy.increaseAge()
me.age
meCopy.age

me === meCopy

// Inheritance
class Vehicle {
    func goVroom(){
        
    }
}

class Car : Vehicle {
    
}

let car = Car()
car.goVroom()

// Private properties
class PersonV2 {
    private var age: Int
    init(age: Int) {
        self.age = age
    }
    func increateAge(){
        self.age += 1
    }
}

let person = PersonV2(age: 27)
//person.age
person.increateAge()

// Private only setter
class PersonV3 {
    private(set) var age: Int
    init(age: Int) {
        self.age = age
    }
    func increateAge(){
        self.age += 1
    }
}
let person1 = PersonV3(age: 27)
person1.age
person1.increateAge()
//person1.age = 26


class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    // Designated initializers
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    init(model: String, year: Int){
        self.model = model
        self.year = year
    }
    
    // Convenience initializers
    convenience init(model: String){
        self.init(model: model, year: 2025)
    }
}

class TeslaModelY : Tesla {
    override init() {
        super.init()
        // super.init(model: "Y") // We cant call convenience inside designation init
    }
}

let modelY = TeslaModelY()
modelY.model
modelY.year
modelY.manufacturer

// De initializers
class DB{
    init(){
        "Connect to db"
    }
    func query(){
        
    }
    deinit{
        "Disconnect"
    }
}

let db = DB()
db.query()

// Simulate deinit
let simpleClosure = {
    let dbInternal = DB()
    dbInternal.query()
}
simpleClosure()
