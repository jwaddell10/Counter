//: [Previous](@previous)

import Foundation

let luckyNumbers = [7, 4, 38, 21, 16, 15, 12, 33, 31, 49]

let filteredNumbers = luckyNumbers.filter { number in number % 2 == 0 }.sorted().map { "\($0) is a lucky number"}

func printEachItem(_ items: [String]) {
    for item in items {
        print("\(item) is a lucky number")
    }
}

printEachItem(filteredNumbers)
