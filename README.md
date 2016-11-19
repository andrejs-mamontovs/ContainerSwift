# Lightweight Swift implementation of Inversion of Control Container

```Swift
public protocol AP {
    var name: String {get}
}

public class A : AP {
    public var name: String = "Test"
}

var container = Container()

container.register(AP.self, creator: { _ in A()})

var instance = container.resolve(AP.self)

```