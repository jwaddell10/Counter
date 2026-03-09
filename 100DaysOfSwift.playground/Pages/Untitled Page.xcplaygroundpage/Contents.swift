import UIKit

var arrayOfStrings = ["String", "test", "test", "Item", "Stores", "here", "seven"]

var uniqueStringsSet = Set(arrayOfStrings)

print(arrayOfStrings.count, uniqueStringsSet.count, "unique count")
