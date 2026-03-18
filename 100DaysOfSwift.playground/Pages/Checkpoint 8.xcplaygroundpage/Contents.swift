//: [Previous](@previous)

import Foundation

protocol Building {
    var numberOfRooms: Int { get }
    var cost: Int { get set }
    var estateAgentName: String { get set }
    func printSalesSummary(summary: String)
}

struct House: Building {
    let numberOfRooms = 8
    var cost = 500_000
    var estateAgentName = "Billy Bob"
    
    func printSalesSummary(summary: String) {
        print("The house has \(numberOfRooms) rooms, costs $\(cost) dollars and the agent is \(estateAgentName)")
    }
}

struct Office: Building {
    let numberOfRooms = 100
    var cost = 500_000_000
    var estateAgentName = "Rich Salesman"
    
    func printSalesSummary(summary: String) {
        print("The house has \(numberOfRooms) rooms, costs $\(cost) dollars and the agent is \(estateAgentName)")
    }
}

let newHome = House()
