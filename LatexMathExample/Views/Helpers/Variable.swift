//
//  Variable.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-09.
//

import Foundation

struct Variable {
    var type: Int
    var input: String
    var unit: Int
    var validInput: Bool {
        if input == "g" && types[type] == "Acceleration" {
            return true
        }
        if let _ = Double(input) {
            return true
        }
        return false
    }
    var value: Double {
        if validInput {
            if input == "g" && types[type] == "Acceleration" {
                return 9.8 / Double(unitValues[3][unit])
            }
            return Double(input)!
        }
        return 1
    }
    var sigFigs: Int {
        if !validInput || input == "g" {
            return 10
        }
        var isSigFig = true
        var hasDecimal = false
        var sigFigCounter = 0
        var zeroCounter = 0
        for currentCharacter in input {
            if currentCharacter != "0" {
                isSigFig = true
            }
            if isSigFig {
                if currentCharacter == "e" || currentCharacter == "E" {
                    break
                }
                if hasDecimal {
                    sigFigCounter += 1
                    continue
                }
                if currentCharacter == "." {
                    hasDecimal = true
                    sigFigCounter += zeroCounter
                    continue
                }
                if currentCharacter == "0" {
                    zeroCounter += 1
                }
                else {
                    sigFigCounter += zeroCounter + 1
                    zeroCounter = 0
                }
            }
        }
        return sigFigCounter
    }
}
