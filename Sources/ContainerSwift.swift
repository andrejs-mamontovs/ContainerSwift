public class ContainerSwift : Resolver {

    var list = [Index: Any]()
    
    public func register<T>(_ t: T.Type, creator:(Resolver) -> T) {
        // create record
        list[Index(type: t)] = Value<T>(creator: creator)
    }

    public func resolve<T>(_ t: T.Type) -> T? {
        return resolveInternal(index: Index(type: t)) {
            (creator: (Resolver) -> T) in creator(self)
        }
    }
    
    func resolveInternal<T, F>(index: Index, caller: (F)-> T) -> T? {
        // cast value
        let v = list[index] as? Value<T>
        return caller(v?.creator as! F)
    }
    
    class Index : Hashable, Equatable {
        
        let type : FunctionType.Type;
        
        public init(type: FunctionType.Type) {
            self.type = type;
        }
        
        public var hashValue: Int {
            get {
                return String(describing: type).hashValue
            }
        }
        public static func ==(lhs: Index, rhs: Index) -> Bool {
            return lhs.type == rhs.type;
        }
    }
}

typealias FunctionType = Any

public class Value<T> {
    
    let creator: FunctionType
    
    init(creator: FunctionType) {
        self.creator = creator
    }
}

public protocol Resolver {   
    func resolve<T>(_ t: T.Type) -> T?
}