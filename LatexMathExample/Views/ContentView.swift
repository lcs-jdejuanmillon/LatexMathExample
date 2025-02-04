//
//  ContentView.swift
//  CulminatingProject
//
//  Created by Jacobo de Juan Millon on 2022-05-08.
//
// Task
import SwiftUI
import RichTextView

struct ContentView: View {
    @State var customSigFigs = false
    @State var numberSigFigs = 1
    @State var listOfKnowns = [Variable(type: 0, input: "", unit: 0)]
    @State var isNotUsed = [false, true, true, true, false]
    @State var solutionType = 4
    @State var solutionUnit = 0
    @State var aux = [0]
    @State var scientificNotation = false
    @State var removingActivated = false
    var showButton: Bool {
        if listOfKnowns.count < 3 {
            return false
        }
        for i in 0..<listOfKnowns.count {
            if !listOfKnowns[i].validInput || (!isVector[listOfKnowns[i].type] && listOfKnowns[i].value <= 0) {
                return false
            }
        }
        return true
    }
    var body: some View {
        VStack(alignment: .leading) {
            Toggle(isOn: $scientificNotation, label: {Text("Scientific Notation in Solution")})
            Toggle(isOn: $customSigFigs, label: {Text("Custom Significant Figures")})
            Stepper(value: $numberSigFigs, in: 1...10, step: 1, label: {Text("Significant Figures: \(numberSigFigs)")})
                .opacity(customSigFigs ? 1.0 : 0.0)
            VStack {
                MathTextView(string: .constant("Use \"g\" for the acceleration due to gravity. Use 'e' or 'E' for scientific notation. [math]1.2e3[/math],  [math]1.2E3[/math], and [math]1200[/math] are all valid and equivalent inputs but [math]1.2\\times10^3[/math]  and any other format is not."))
            }
            .frame(height: 150)
            HStack {
                Image(systemName: "plus.circle")
                    .foregroundColor(.blue)
                    .opacity(listOfKnowns.count == types.count - 1 ? 0.0 : 1.0)
                    .onTapGesture {
                        let x = listOfOptions(i: 0)
                        let y = isNotUsed[x[0]] ? x[0] : x[1]
                        listOfKnowns.append(Variable(type: y, input: "", unit: 0))
                        isNotUsed[y] = false
                        aux.append(y)
                    }
                Text("List of Knowns:")
                    .bold()
                Spacer()
                Button(action: {
                    removingActivated = !removingActivated
                }, label: {
                    Text(removingActivated ? "Done" : "Edit")
                })
            }
            ForEach(0..<listOfKnowns.count, id: \.self) { i in
                HStack {
                    Image(systemName: "minus.circle")
                        .foregroundColor(.red)
                        .opacity(removingActivated ? 1.0 : 0.0)
                        .onTapGesture {
                            isNotUsed[i] = true
                            listOfKnowns[i].unit = 0
                            listOfKnowns[i].input = ""
                            listOfKnowns.remove(at: i)
                        }
                    Picker("Type of known", selection: $listOfKnowns[i].type) {
                        ForEach(listOfOptions(i: listOfKnowns[i].type), id: \.self) { j in
                            Text(types[j])
                        }
                    }
                    .frame(width: 150)
                    .onChange(of: listOfKnowns[i].type) { newValue in
                        isNotUsed[aux[i]] = true
                        isNotUsed[newValue] = false
                        aux[i] = newValue
                        listOfKnowns[i].unit = 0
                    }
                    TextField("Value", text: $listOfKnowns[i].input)
                    Picker("Units", selection: $listOfKnowns[i].unit) {
                        ForEach(0..<unitValues[listOfKnowns[i].type].count, id: \.self) { j in
                            Text(unitText[listOfKnowns[i].type][j])
                        }
                    }
                    Spacer()
                }
                ZStack {
                    Text("* Give a valid numeric value for the \(types[listOfKnowns[i].type])")
                        .opacity(listOfKnowns[i].validInput ? 0.0 : 1.0)
                    Text("* \(types[listOfKnowns[i].type]) has to be positive")
                        .opacity(isVector[listOfKnowns[i].type] || !listOfKnowns[i].validInput || listOfKnowns[i].value > 0 ? 0.0 : 1.0)
                }
                .foregroundColor(.red)
                .font(.caption2)
            }
            HStack {
                Text("Solve for:")
                Picker("Type of known", selection: $solutionType) {
                    ForEach(listOfOptions(i: solutionType), id: \.self) { j in
                        Text(types[j])
                    }
                }
                .onChange(of: solutionType) { [solutionType] newValue in
                    isNotUsed[solutionType] = true
                    isNotUsed[newValue] = false
                    solutionUnit = 0
                }
                Text("in:")
                Picker("Units", selection: $solutionUnit) {
                    ForEach(0..<unitValues[solutionType].count, id: \.self) { j in
                        Text(unitText[solutionType][j])
                    }
                }
            }
            ButtonView
            Spacer()
        }
        .padding()
    }
    var ButtonView: some View {
        HStack {
            NavigationLink(destination: SolutionView(knowns: listOfKnowns,
                                                     solveFor: solutionType,
                                                     unit: solutionUnit,
                                                     sigFigs: getSigFigs(),
                                                     scientificNotation: scientificNotation)) {
                Text("Show Solution")
            }
            Spacer()
        }
        .opacity(showButton ? 1.0 : 0.0)

    }
    func listOfOptions(i: Int) -> [Int] {
        var list: [Int] = []
        for j in 0..<types.count {
            if isNotUsed[j] || i == j {
                list.append(j)
            }
        }
        return list
    }
    func getSigFigs() -> Int {
        if customSigFigs {
            return numberSigFigs
        }
        var sigFigs = 10
        for i in 0..<listOfKnowns.count {
            sigFigs = min(sigFigs, listOfKnowns[i].sigFigs)
        }
        return sigFigs
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
