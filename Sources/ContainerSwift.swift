public class ContainerSwift: Resolver {

    var list = [Index: Any]()

    public func register<T>(_ t: T.Type, creator: @escaping (any Resolver) -> T) {
        list[Index(type: t)] = Value<T>(creator: creator)
    }

    public func resolve<T>(_ t: T.Type) -> T {
        let index = Index(type: t)
        guard let value = list[index] as? Value<T> else {
            fatalError("No registration found for type \(String(describing: t))")
        }
        return value.creator(self)
    }

    class Index: Hashable {

        let type: Any.Type

        init(type: Any.Type) {
            self.type = type
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(ObjectIdentifier(type))
        }

        static func == (lhs: Index, rhs: Index) -> Bool {
            lhs.type == rhs.type
        }
    }
}

public class Value<T> {

    let creator: (any Resolver) -> T

    init(creator: @escaping (any Resolver) -> T) {
        self.creator = creator
    }
}

public protocol Resolver {
    func resolve<T>(_ t: T.Type) -> T
}
