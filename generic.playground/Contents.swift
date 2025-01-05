import Foundation

func perform<T>(_ op: (T, T)-> T, on lhs: T, and rhs: T) -> T {
    op(lhs, rhs)
}

func performV2<T: Numeric>(_ op: (T, T)-> T, on lhs: T, and rhs: T) -> T {
    op(lhs, rhs)
}


let x = performV2(+, on: 1.75, and: 2)
let y = perform(-, on: 3, and: 7)


protocol CanJump {
    func jump()
}

protocol CanRun {
    func run()
}

struct Person : CanRun, CanJump {
    func run() {
        
    }
    func jump() {
        
    }
}


func jumpAndRun<T: CanJump & CanRun>(value: T){
    value.jump()
    value.run()
}

let person = Person()
jumpAndRun(value: person)

let names: Array<String> = ["Fooo", "Bar"]
let namesV2: [String] = ["FoooV2", "BarrrV2"]

extension [String]{
    func longestString() -> String?{
        self.sorted { lhs, rhs in
            return lhs.count > rhs.count
        }.first
    }
}

names.longestString()
namesV2.longestString()

protocol View {
    func addSubView(_ view: View)
}

extension View {
    func addSubView(_ view: View){
        
    }
}

struct Button: View{
}

struct Table: View{
}

protocol PresentableAsView {
    associatedtype ViewType: View
    func produceView()->ViewType
    func configure(superView: View, thisView: ViewType)
    func present(view: ViewType, on superView: View)
}


extension PresentableAsView{
    func configure(superView: View, thisView: ViewType){
        
    }
    func present(view: ViewType, on superView: View){
        superView.addSubView(view)
    }
}

struct MUIButton: PresentableAsView {
    func produceView() -> some View {
        Button()
    }
}


extension PresentableAsView where ViewType == Button {
    func something()->String{
        "Only table does this"
    }
}

let muiButton : MUIButton = MUIButton()
