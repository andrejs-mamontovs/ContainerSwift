public class ContainerSwift {

    let list:[String];

    var text = "Hello, World!"

    public init() {
        list = [];
    }
    
    func register<T>(_ t: T.Type, creator:() -> T)  {
        print("[\(t)]")
    }
    
    public func resolve<T>(_ t: T.Type) -> T? {
        print("[\(t)]")
        return nil
    }
}