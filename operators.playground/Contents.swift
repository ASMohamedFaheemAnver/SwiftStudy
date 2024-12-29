import Foundation

// 1. unary prefix -> Working with 1 variable
// 2. unary postfix -> Working with 1 variable
// 3. binary infix -> Working with 2 variables
// 4. ternary

let myAge = 27
let yourAge = 26

let condition = myAge > yourAge

let after10YearsMyAge = myAge + 10
let doubleOfYourAge = yourAge * 2

// prefix
let notExample = !true;
// postfix
let name = Optional("Vandad");
let unaryPostFix = name!; // Ensuring it does contain value
// ternary
let tn = true ? 1 : 2
