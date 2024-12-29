import Foundation

// Function
func noArgsAndNoReturn(){
    print("Yo brah!")
}

noArgsAndNoReturn()

// Function that takes args
func plustTwo(value: Int){
    let newValue = value + 2
}

plustTwo(value: 30)

// Function that take args and return
func newPlustTow(value: Int) -> Int {
    return value + 2
}

newPlustTow(value: 45)

// Function that takes 2 args
func customAdd(v1: Int, v2: Int) -> Int{
    return v1+v2
}

let sum = customAdd(v1: 1, v2: 2)

// Extrnal and internal label in function
func customMinus(elhs lhs: Int, erhs rhs: Int)->Int {
    return lhs-rhs
}

customMinus(elhs: 20, erhs: 5)

// Remove label at all
func customMulti(_ lhs: Int, _ rhs: Int)->Int {
    return lhs*rhs
}

customMulti(4, 5)

// Nested function
func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        return value+2
    }
    return mainLogic(value: value)
}

doSomethingComplicated(with: 45)

// Default values
func getFullName(firstName: String = "udev", lastName: String = "nahh")->String {
    return "\(firstName) \(lastName)"
}

getFullName()
getFullName(firstName: "Faheem")
getFullName(lastName: "Sale")
