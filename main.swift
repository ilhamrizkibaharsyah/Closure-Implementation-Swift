//
//  main.swift
//  Electric-Motorcycle
//
//  Created by Ilham Rizki Baharsyah on 17/03/22.
//

import Foundation

// Function to get item from user
func getInput(message: String) -> String? {
    print(message, terminator: " ");
    return readLine()
}

func getInputInt(message: String) -> Int? {
    if let inputString = getInput(message: message) {
        return Int(inputString)
    } else {
        return nil
    }
}

// speedTotal for containing speed variable
var speedTotal = 0

// create @CLOSURE for adding speed
func makeIncrementer(forIncrement amout: Int) -> () -> Int {
    func increment() -> Int {
        speedTotal += amout
        return speedTotal
    }
    return increment
}

// create @CLOSURE for reduce speed
func makeDecrementer(forDecrement amout: Int) -> () -> Int {
    func decrement() -> Int {
        speedTotal -= amout
        return speedTotal
    }
    return decrement
}

// determine value of adding or reduce speed
let incrementSpeed = makeIncrementer(forIncrement: 10)
let decrementSpeed = makeDecrementer(forDecrement: 10)

// turn on motorcycle engine
func turnOnEngine() {
    print("Turn-On Engine...")
    print("Welcome to Dicoding Electricity Motorcycle")
    print("Whushhh...")
}

// turn off motorcycle engine
func turnOffEngine() {
    print("Ciiittt...")
    print("Motorcycle has been stopped.\n")
}

// showing speed
func showSpeed() {
    print("Speed right now is \(speedTotal) km/h")
    print("Ngengggg...")
}

// giving action to electric motorcycle
func action(){
    print("\n-----------------")
    print("START ENGINE")
    print("[1] Adding speed")
    print("[2] Reduce speed")
    print("[3] TurnOff engine")
    if let state = getInputInt(message: "Input your choice:") {
        switch state {
        case 1:
            speedTotal = incrementSpeed()
            showSpeed()
            action()
        case 2:
            if speedTotal > 10 {
                speedTotal = decrementSpeed()
                showSpeed()
                action()
            } else {
                turnOffEngine()
            }
        case 3:
            turnOffEngine()
        default:
            break
        }
    } else {
        print("Input not valid.")
    }
}

// starting program
turnOnEngine()
action()
