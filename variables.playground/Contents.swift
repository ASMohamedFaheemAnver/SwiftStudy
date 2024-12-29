import Foundation

// Can't mutate
let myName = "udev"
let yourName = "naah"

var names = [myName, yourName]
// Mutating
names.append("Bar")
names.append("Mo")

// Assigning complete new array
names = ["1", "2"]
