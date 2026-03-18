//: [Previous](@previous)

import Foundation

class Animal {
    var legs: Int
    
    init(legs: Int) {
        self.legs = legs
    }
}

class Dog: Animal {
    var bark: String
    
    init(legs: Int, bark: String) {
        self.bark = bark
        super.init(legs: legs)
    }
    
    func speak() {
        print("\(bark)")
    }
}

class Cat: Animal {
    var meow: String
    var isTame: Bool
    
    init(legs: Int, meow: String, isTame: Bool) {
        self.meow = meow
        self.isTame = isTame
        super.init(legs: legs)
    }
    
    func speak() {
        print("\(meow)")
    }
}

var dog = Dog(legs: 4, bark: "This is what I sound like when I bark")
var houseCat = Cat(legs: 4, meow: "Meow!", isTame: true)
