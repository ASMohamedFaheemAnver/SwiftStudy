import Foundation

func mutiplyByTwo(_ value: Int? = nil) -> Int{
    if let value {
        return value * 2
    }else{
        return 0
    }
}

mutiplyByTwo()
mutiplyByTwo(5)
mutiplyByTwo(nil)

func checkAge(age: Int?){
    guard age != nil else{
        "Age is nil as expected"
        return
    }
    "Age is not nill here"
}

checkAge(age: nil)

let ageV2: Int? = 0
var ageV3: Int? = nil

switch ageV3 {
case .none:do {
    "Age has no value"
}
case .some(_):do {
    "Age has a value"
}
    
    
    struct Person {
        let name: String
        let address: Address?
        struct Address {
            let firstLine: String?
        }
    }
    
    let me: Person = Person(name: "udev", address: nil)
    me.address?.firstLine
}

