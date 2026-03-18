//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)

enum FindSquareRootError: Error {
    case outOfBounds
    case noInteger
}

func findSquareRoot(number: Int) throws -> Int {
    if number < 1 || number > 10000 {
        throw FindSquareRootError.outOfBounds
    }
    for i in 1...100 {
        if i * i == number {
            print(i)
            return i
        } else {
            continue
        }
    }
    
    throw FindSquareRootError.noInteger
}

do {
    let result = try findSquareRoot(number: 10000)
} catch FindSquareRootError.outOfBounds {
    print("out of bounds")
} catch FindSquareRootError.noInteger {
    print("no integer")
}
