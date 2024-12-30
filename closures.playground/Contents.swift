import Foundation

// Normal function
func add(_ lhs: Int, _ rhs: Int) -> Int{
    return lhs + rhs;
}

// Anonymous function
let addFunc : (Int, Int) -> Int = { // Open closure
    (lhs: Int, rhs: Int) -> Int in // Seperate type and logic/implementation by in
        let x: Int = lhs + rhs
        return x
}

addFunc(1, 3)

// Take a function
func customAdd(_ lhs: Int,
               _ rhs: Int,
               _ innerFunc: (Int, Int)->Int) -> Int{
    // Return inner function value
    return innerFunc(lhs, rhs)
}

// Passing already defined function
customAdd(20, 30, addFunc)
// Padding anonymous function
customAdd(20, 30, {
    (lhs: Int, rhs: Int) -> Int in
        return lhs + rhs
})
// Swift allow us to do this if last param is a function which is called trailing closure
customAdd(20, 30) {
    (lhs: Int, rhs: Int) -> Int in
        return lhs + rhs
}

// Since customAdd function already have the function/closure type we can remove them
// This will take time for the compiler to figure out the types on compile time, better to add them
customAdd(20, 30) {
    (lhs, rhs) in
        return lhs + rhs
}

// More simpler but takes time to compile them in larger apps
customAdd(20, 30) {
        // Means add first and second param
        return $0 + $1
}

let ages = [30, 20, 19, 40]
// Sort the array
// Method 1
ages.sorted(by: {$0 > $1})
// Method 2
ages.sorted(by: {(lhs: Int, rhs: Int)-> Bool in
        return lhs > rhs
})
// Method 3
ages.sorted(){
    $0 > $1
}
// Method 4
ages.sorted(){
    (lhs: Int, rhs: Int)->Bool in
        lhs > rhs
}
// Method 5, only pass operator that compare 2 elements
ages.sorted(by: >)
ages.sorted(by: <)

