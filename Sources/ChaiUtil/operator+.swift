// The Swift Programming Language
// https://docs.swift.org/swift-book

infix operator **: MultiplicationPrecedence

public func **(_ lhs: Int, _ rhs: UInt) -> Int {
    var result = 1, cur = rhs
    while cur > 0 {
        result *= lhs
        cur -= 1
    }
    return result
}

func == <Root, Value: Equatable>(_ lhs: KeyPath<Root, Value>, _ rhs: Value) -> (Root) -> Bool {
    { $0[keyPath: lhs] == rhs }
}
