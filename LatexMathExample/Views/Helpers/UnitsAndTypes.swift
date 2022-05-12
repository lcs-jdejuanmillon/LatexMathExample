//
//  UnitsAndTypes.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-09.
//

import Foundation

let types = ["Time", "Displacement", "Initial Velocity", "Final Velocity", "Acceleration"]
let isVector = [false, true, true, true, true]
struct unit {
    let text: String
    let value: Double
}
let unitText = [
    ["s", "min", "h"],
    ["m", "km", "cm", "mm"],
    ["m/s", "km/h"],
    ["m/s", "km/h"],
    ["m/s^2"]
]
let unitValues = [
    [1, 60, 3600],
    [1, 1000, 0.01, 0.001],
    [1, 10/36],
    [1, 10/36],
    [1]
]
