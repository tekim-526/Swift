//
//  ContentView.swift
//  Action Sheet
//
//  Created by Kim TaeSoo on 2021/10/21.
//

import SwiftUI

struct ContentView: View {
    @State var showingSheet = false
    var body: some View {
        Button(action: {
            self.showingSheet = true
        }) {
            Text("Show Action Sheet")
        }
        .actionSheet(isPresented: $showingSheet) {
            ActionSheet(title: Text("Title"), message: Text("Message"))
        }
        
    }
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro"))
    }
}
#endif
