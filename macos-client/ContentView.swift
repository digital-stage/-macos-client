//
//  ContentView.swift
//  macos-client
//
//  Created by Tobias Hegemann on 05.02.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Hello, World!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            Text("Hello, World!")
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
