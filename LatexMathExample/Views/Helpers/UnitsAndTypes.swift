//
//  UnitsAndTypes.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-09.
//

import Foundation

let types = ["Time", "Initial Velocity", "Final Velocity", "Acceleration", "Displacement"]
let isVector = [false, true, true, true, true]
struct unit {
    let text: String
    let value: Double
}
let unitText = [
    ["s", "min", "h"],
    ["m/s", "km/h"],
    ["m/s", "km/h"],
    ["m/s\u{00B2}"],
    ["m", "km", "cm", "mm"]
]
let unitValues = [
    [1.0, 60.0, 3600.0],
    [1.0, 1000.0, 0.01, 0.001],
    [1.0, 10.0/36.0],
    [1.0, 10.0/36.0],
    [1.0]
]
