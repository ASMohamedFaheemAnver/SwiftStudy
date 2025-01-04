import Foundation


struct AnimalVTemp {
    let type: String
    init(type: String) {
        if(type == "Rabbit" || type == "Cat" || type == "Dog"){
            self.type = type
        }else{
            preconditionFailure()
        }
    }
}

//This will not provide a inteligent what to pass
//let dog = AnimalVTemp(type: "Cake")


enum Animals {
    case Cat
    case Dog
    case Rabbit
    case UTest
}

struct Animal{
    let type: Animals
}

let dog = Animal(type: Animals.Dog)
if(dog.type == Animals.Cat){
   "This is a cat"
}else {
    "This is not a cat"
}

switch (dog.type){
case .Cat:
    "This is a cat"
    break
case .Dog:
    "This is a dog"
    break
case .Rabbit:
    "This is a rabbit"
    break
default:
    "Unknown"
}


// Assosiative value
enum Shortcut {
    case fileOrFolder
    case wwwUrl(path: URL)
    case song
}

let wwwApple = Shortcut.wwwUrl(path: URL(string: "http://apple.com")!)
wwwApple

// 1
switch wwwApple {
case .fileOrFolder:
    "This is a file or folder"
    break
case .wwwUrl(path: let path):
    path
    break
case .song:
    "This is a song"
    break
}

// 2
switch wwwApple {
case .fileOrFolder:
    "This is a file or folder"
    break
case .wwwUrl(let path):
    path
    break
case .song:
    "This is a song"
    break
}

// 3
switch wwwApple {
case .fileOrFolder:
    "This is a file or folder"
    break
case let .wwwUrl(path):
    path
    break
case .song:
    "This is a song"
    break
}

if case let .wwwUrl(path) = wwwApple {
    path
}

if case Shortcut.fileOrFolder = wwwApple {
    "This is file or folder"
}


enum Vehicle {
    case Car(manufacturer: String, model: String)
    case Bike(manufacturer: String, yearMade: Int)
}

let car = Vehicle.Car(manufacturer: "Tesla", model: "X")
let bike = Vehicle.Bike(manufacturer: "Honda", yearMade: 2019)

switch car {
case .Car(manufacturer: let manufacturer, model: let model):
    manufacturer
    break
case .Bike(manufacturer: let manufacturer, _):
    manufacturer
    break
}

func getManufacturer(vehicle: Vehicle) -> String{
    switch vehicle {
    case .Car(manufacturer: let manufacturer, _):
       return manufacturer
    case .Bike(manufacturer: let manufacturer, _):
       return manufacturer
    }
}

getManufacturer(vehicle: car)
getManufacturer(vehicle: bike)


enum VehicleV2 {
    case Car(manufacturer: String, model: String)
    case Bike(manufacturer: String, yearMade: Int)
    func getManufacturer() -> String{
        switch self {
        case .Car(manufacturer: let manufacturer, _):
           return manufacturer
        case .Bike(manufacturer: let manufacturer, _):
           return manufacturer
        }
    }
}

let carv2 = VehicleV2.Car(manufacturer: "Tesla", model: "X")
let bikev2 = VehicleV2.Bike(manufacturer: "Honda", yearMade: 2019)

carv2.getManufacturer()
bikev2.getManufacturer()


enum FamilyMember: String {
    case Father = "Dad"
    case Mother = "Mom"
    case Brother = "Bro"
    case Sister = "Sis"
}

FamilyMember.Brother.rawValue

enum FavoriteEmoji: String, CaseIterable {
    case Blush
    case Rocket
    case Fire
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

if let blush = FavoriteEmoji(rawValue: "Blush"){
    "Found the blush emoji"
}


// Mutating enum
enum Hight {
    case Short, Medium, Long
    mutating func makeLong(){
        self = Hight.Long
    }
}

var myHight = Hight.Medium
myHight.makeLong()

// Indirect enum
indirect enum IntOperation{
    case add(Int, Int)
    case subtract(Int, Int)
    case freeHand(IntOperation)
    func calculateResult(of operation: IntOperation? = nil) -> Int{
        switch operation ?? self {
        case let .add(lhs, rhs):
            return lhs + rhs
        case let .subtract(lhs, rhs):
            return lhs - rhs
        case let .freeHand(operation):
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freeHand(.add(2, 4))
freeHand.calculateResult()
