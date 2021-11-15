//
//  ContentView.swift
//  Textfiled
//
//  Created by Kim TaeSoo on 2021/10/21.
//


import SwiftUI
// Swift의 Form은 HStack, VStack과 같은 컨테이너와 비슷하게 작동함
// 즉 Form 안에 여러가지 View를 넣을 수 있다
struct ContentView2: View {
    @State var toggling = false
    var body: some View {
        NavigationView {
            Form {
                Toggle(isOn: $toggling) {
                    Text("Toggly")
                }
                Button(action: {
                }){
                    Text("Save changes")
                }
            }.navigationTitle(Text("Settings"))
        }
    }
}

struct ContentView: View {
    @State var toggling = false
    var body: some View {
        NavigationView {
            Form {
                Section(footer: Text("footer")) {
                    Toggle(isOn: $toggling) {
                        Text("Toggly")
                    }
                }
                Section {
                    Button(action: {}){
                        Text("Save Changes")
                    }
                }.disabled(!toggling)
            }.navigationBarTitle("Settings")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
