# Lightweight Swift implementation of Inversion of Control Container

```Swift
public class A {
}

Container().register(A.self, creator: {A()})
var a = Container().resolve(A.self)
```