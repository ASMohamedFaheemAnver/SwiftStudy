import Foundation


struct Person {
    let firstName: String?
    let lastName: String?
    
    enum PersonErrors: Error {
        case firstNameIsNil
        case lastNameIsNil
        case fullNameIsNil
    }
    
    func getFullName() throws -> String{
        switch (firstName, lastName){
        case (.none, .none): do{
            throw PersonErrors.fullNameIsNil
        }
        case (.none, .some(_)): do{
            throw PersonErrors.firstNameIsNil
        }
        case (.some(_), .none): do{
            throw PersonErrors.lastNameIsNil
        }
        case let (.some(fN), .some(lN)): do {
            return "\(fN) \(lN)"
        }
            
        }
    }
}

let me = Person(firstName: "Udev", lastName: nil)
//me.getFullName()

do {
    let fullName = try me.getFullName()
}
//catch let e{
//    "Got an error = \(e)"
//}
catch{
    "Got an error = \(error)"
}

do {
    let fullName = try me.getFullName()
}catch is Person.PersonErrors {
    "Got person errors"
}

do {
    let fullName = try me.getFullName()
}catch Person.PersonErrors.lastNameIsNil {
    "Got first name error"
}catch Person.PersonErrors.lastNameIsNil {
    "Got last name error"
}catch Person.PersonErrors.fullNameIsNil {
    "Got last name error"
}


struct Car {
    let manufacturer: String
    enum Errors: Error{
        case invalidManufacturer
    }
    init(manufacturer: String) throws {
        if(manufacturer.isEmpty) {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
}catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
}


do {
    let myCar = try Car(manufacturer: "BMW")
}catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
}

if let myCar = try? Car(manufacturer: ""){
    "Success"
}else{
    "Failed"
}


let tCar = try! Car(manufacturer: "Ford")
tCar.manufacturer


func reThrowFunc(f: String?, l: String, calculate: (String?, String?) throws -> String?) rethrows -> String?{
    try calculate(f, l)
}

///Useful when writing API Calls
enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(forValue value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(forValue: 0)
performGet(forValue: 2)
