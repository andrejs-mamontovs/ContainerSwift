public class ContainerSwift : Resolver {

    var list = [Index: Any]()
    
    public func register<T>(_ t: T.Type, creator: @escaping (Resolver) -> T) {
        // create record
        list[Index(type: t)] = Value<T>(creator: creator)
    }

    public func resolve<T>(_ t: T.Type) -> T {
        return resolveInternal(index: Index(type: t)) {
            (creator: (Resolver) -> T) in creator(self)
        }
    }
    
    func resolveInternal<T, F>(index: Index, caller: (F)-> T) -> T {
        // cast value
        let v = list[index] as? Value<T>
        return caller(v?.creator as! F)
    }
    
    class Index : Hashable, Equatable {
        
        let type : FunctionType.Type;
        
        public init(type: FunctionType.Type) {
            self.type = type;
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(type))
        }
        
        public static func ==(lhs: Index, rhs: Index) -> Bool {
            return lhs.type == rhs.type;
        }
    }
}

typealias FunctionType = Any

public class Value<T> {
    
    let creator: (Resolver) -> T
    
    init(creator: @escaping (Resolver) -> T) {
        self.creator = creator
    }
}

public protocol Resolver {   
    func resolve<T>(_ t: T.Type) -> T
}