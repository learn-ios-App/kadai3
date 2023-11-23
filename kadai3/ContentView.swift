//
//  ContentView.swift
//  kadai3
//
//  Created by 渡邊魁優 on 2023/11/23.
//

import SwiftUI

struct ContentView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State private var sum = 0
    
    @State private var isAlert = false
    @State private var message = ""
    
    var body: some View {
        VStack {
            VStack {
                TextField("", text: $number1)
                TextField("", text: $number2)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 200)
            .padding()
            
            Button(action: {
                sum = calclation(number1, number2)
            }) {
                Text("計算")
            }
            Text("合計 \(sum)")
                .padding()
        }
        .alert(message, isPresented: $isAlert, actions: {})
    }
    
    private func calclation(_ number1: String, _ number2: String) -> Int {
        if self.number1 == "" || self.number2 == "" {
            showAlert(message: "数字を入力してください")
        }
        return parseNumber(number1) + parseNumber(number2)
    }
    private func showAlert(message: String) {
        self.message = message
        isAlert = true
    }
    private func parseNumber(_ number: String) -> Int {
        return Int(number) ?? 0
    }
}

#Preview {
    ContentView()
}
