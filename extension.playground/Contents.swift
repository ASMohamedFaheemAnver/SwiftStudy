import Foundation

extension Int {
    func plusTwo() -> Int {
        self + 2
    }
}

let n = 3
n.plusTwo()


struct Person {
    let firstName: String
    let lastName: String
}

extension Person {
    init(fullName: String){
       let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName, lastName: components.last ?? fullName)
    }
}

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName


protocol GoesVRoom {
    var vroomValue: String {get}
    func goVroom() -> String
}

extension GoesVRoom {
    func goVroom()-> String {
        "\(self.vroomValue) goes vroom!"
    }
}


struct Car {
    let manufacturer: String
    let model: String
}

let modelX = Car(manufacturer: "Tesla", model: "X")

extension Car: GoesVRoom {
    var vroomValue: String {
        "\(self.manufacturer) model \(self.model)"
    }
}

modelX.vroomValue
modelX.goVroom()


class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init(){
        self.init(value: 0)
    }
}

let foo = MyDouble(value: 10)
let foo1 = MyDouble()


