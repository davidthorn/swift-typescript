import Foundation

public protocol AppClass {
    
}

public class Main {

    public func add(object: AppClass.Type ) {
        print(object)
    }

    public func run() {

        print("hello world")

    }

}

public class Home: AppClass {
    public init() {

    }
}

let app = Main()
app.add(object: Home.self)
app.run()