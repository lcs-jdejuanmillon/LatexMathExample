//
//  SolutionView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-11.
//
// Have option to output scientific notation
import SwiftUI

struct SolutionView: View {
    let knowns: [Variable]
    let solveFor: Int
    let unit: Int
    let sigFigs: Int
    let scientificNotation: Bool
    var indexOfKnown: [Int] {
        var indexOfKnown = [0, 0, 0, 0, 0]
        for i in 0..<knowns.count {
            indexOfKnown[knowns[i].type] = i
        }
        return indexOfKnown
    }
    var index: Int {
        var index = 6
        for i in 0..<knowns.count {
            index -= knowns[i].type
        }
        return index
    }
    var body: some View {
        VStack(alignment: .center) {
            Solve()
        }
    }
    func Solve() -> MathTextView {
        if index == 0 {
            if unit == 0 {
                return MathTextView(string: .constant("""
        [math] \\vec{v_2}^2 = \\vec{v_1}^2 + 2\\vec{a}\\Delta \\vec{d} [/math]
        [math] \\vec{v_1}^2 + 2\\vec{a}\\Delta \\vec{d} = \\vec{v_2}^2 [/math]
        [math] 2\\vec{a}\\Delta \\vec{d} = \\vec{v_2}^2 - \\vec{v_1}^2 [/math]
        [math] \\Delta \\vec{d} = \\frac{\\vec{v_2}^2 - \\vec{v_1}^2)}{2\\vec{a}} [/math]
        [math] \\Delta \\vec{d} = \\frac{\(str(i: actualValue(i: 2), isAnswer: false))^2 - \(str(i: actualValue(i: 1), isAnswer: false))^2}{2(\(str(i: actualValue(i: 3), isAnswer: false))} [/math]
        [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 2) - actualValue(i: 1) * actualValue(i: 1)) / 2 / actualValue(i: 3), isAnswer: true)) \(unitText[solveFor][0]) [/math]
        """))
            }
            return MathTextView(string: .constant("""
    [math] \\vec{v_2}^2 = \\vec{v_1}^2 + 2\\vec{a}\\Delta \\vec{d} [/math]
    [math] \\vec{v_1}^2 + 2\\vec{a}\\Delta \\vec{d} = \\vec{v_2}^2 [/math]
    [math] 2\\vec{a}\\Delta \\vec{d} = \\vec{v_2}^2 - \\vec{v_1}^2 [/math]
    [math] \\Delta \\vec{d} = \\frac{\\vec{v_2}^2 - \\vec{v_1}^2)}{2\\vec{a}} [/math]
    [math] \\Delta \\vec{d} = \\frac{\(str(i: actualValue(i: 2), isAnswer: false))^2 - \(str(i: actualValue(i: 1), isAnswer: false))^2}{2(\(str(i: actualValue(i: 3), isAnswer: false))} [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 2) - actualValue(i: 1) * actualValue(i: 1)) / 2 / actualValue(i: 3), isAnswer: false)) \(unitText[solveFor][0]) [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 2) - actualValue(i: 1) * actualValue(i: 1)) / 2 / actualValue(i: 3) / unitValues[solveFor][unit], isAnswer: true)) \(unitText[solveFor][unit]) [/math]
    """))
        }
        if index == 1 {
            if unit == 0 {
                return MathTextView(string: .constant("""
          [math] \\Delta \\vec{d} = \\vec{v_2} \\Delta t - \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
          [math] \\Delta \\vec{d} = \\vec{v_2} \\Delta t - \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
          [math] \\Delta \\vec{d} = (\(str(i: actualValue(i: 2), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false))) - \\frac{1}{2}(\(str(i: actualValue(i: 3),isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false)))^2 [/math]
          [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 0) - actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2), isAnswer: true)) \(unitText[solveFor][0]) [/math]
        """))
            }
            return MathTextView(string: .constant("""
    [math] \\Delta \\vec{d} = \\vec{v_2} \\Delta t - \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
    [math] \\Delta \\vec{d} = \\vec{v_2} \\Delta t - \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
    [math] \\Delta \\vec{d} = (\(str(i: actualValue(i: 2), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false))) - \\frac{1}{2}(\(str(i: actualValue(i: 3),isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false)))^2 [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 0) - actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2), isAnswer: false)) \(unitText[solveFor][0]) [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 2) * actualValue(i: 0) - actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2) / unitValues[solveFor][unit], isAnswer: true)) \(unitText[solveFor][unit]) [/math]
    """))
        }
        if index == 2 {
            if unit == 0 {
                return MathTextView(string: .constant("""
        [math] \\Delta \\vec{d} = \\vec{v_1} \\Delta t + \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
        [math] \\Delta \\vec{d} = \\vec{v_1} \\Delta t + \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
        [math] \\Delta \\vec{d} = (\(str(i: actualValue(i: 1), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false))) + \\frac{1}{2}(\(str(i: actualValue(i: 3), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false)))^2 [/math]
        [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) * actualValue(i: 0) + actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2), isAnswer: true)) \(unitText[solveFor][0]) [/math]
        """))
            }
            return MathTextView(string: .constant("""
    [math] \\Delta \\vec{d} = \\vec{v_1} \\Delta t + \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
    [math] \\Delta \\vec{d} = \\vec{v_1} \\Delta t + \\frac{1}{2} \\vec{a} + \\Delta t^2 [/math]
    [math] \\Delta \\vec{d} = (\(str(i: actualValue(i: 1), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false))) + \\frac{1}{2}(\(str(i: actualValue(i: 3), isAnswer: false)))(\(str(i: actualValue(i: 0), isAnswer: false)))^2 [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) * actualValue(i: 0) + actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2), isAnswer: false)) \(unitText[solveFor][0]) [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) * actualValue(i: 0) + actualValue(i: 3) * actualValue(i: 0) * actualValue(i: 0) / 2) / unitValues[solveFor][unit], isAnswer: true)) \(unitText[solveFor][unit]) [/math]
    """))
        }
        if unit == 0 {
            return MathTextView(string: .constant("""
    [math] \\Delta \\vec{d} = (\\frac{\\vec{v_1}+\\vec{v_2}}{2}) \\Delta t [/math]
    [math] \\Delta \\vec{d} = (\\frac{\(str(i: actualValue(i: 1), isAnswer: false))+\(str(i: actualValue(i: 2), isAnswer: false))}{2}) \(str(i: actualValue(i: 0), isAnswer: false)) [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) + actualValue(i: 2)) * actualValue(i: 0) / 2, isAnswer: true)) \(unitText[solveFor][0])[/math]
    """))
        }
        return MathTextView(string: .constant("""
[math] \\Delta \\vec{d} = (\\frac{\\vec{v_1}+\\vec{v_2}}{2}) \\Delta t [/math]
[math] \\Delta \\vec{d} = (\\frac{\(str(i: actualValue(i: 1), isAnswer: false))+\(str(i: actualValue(i: 2), isAnswer: false))}{2}) \(str(i: actualValue(i: 0), isAnswer: false)) [/math]
    [math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) + actualValue(i: 2)) * actualValue(i: 0) / 2, isAnswer: false)) \(unitText[solveFor][0])[/math]
[math] \\Delta \\vec{d} = \(str(i: (actualValue(i: 1) + actualValue(i: 2)) * actualValue(i: 0) / 2 / unitValues[solveFor][unit], isAnswer: true)) \(unitText[solveFor][unit])[/math]
"""))
    }
    func actualValue(i: Int) -> Double {
        return knowns[indexOfKnown[i]].value * unitValues[knowns[indexOfKnown[i]].type][knowns[indexOfKnown[i]].unit]
    }
    func str(i: Double, isAnswer: Bool) -> String {
        if i == 0 {
            return "0"
        }
        let x = Int((log10(abs(i)))) + 1
        let y = pow(10.0, Double(sigFigs - x))
        if (isAnswer && scientificNotation) || (abs(x) > 4 && !isAnswer) {
            return "\(String(format: "%.\(sigFigs - 1)f", i / pow(10.0, Double(x - 1))))\\times 10^\(x - 1)"
        }
        if sigFigs < x {
            return "\(Int(round(i * y) / y))"
        }
        if sigFigs == x {
            return "\(Int(round(i * y) / y))."
        }
        return String(format: "%.\(sigFigs - x)f", i)
    }
}

struct SolutionView_Previews: PreviewProvider {
    static var previews: some View {
        SolutionView(knowns: [Variable(type: 0, input: "2", unit: 0),
                              Variable(type: 1, input: "3", unit: 0),
                              Variable(type: 2, input: "4", unit: 0)],
                     solveFor: 4,
                     unit: 0,
                     sigFigs: 3,
                     scientificNotation: false)
    }
}
