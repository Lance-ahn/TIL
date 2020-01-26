//
//  ContentView.swift
//  FBGroupsSwiftUI
//
//  Created by macbook on 2020/01/26.
//  Copyright © 2020 Lance. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                Text("First row")
            }.navigationBarTitle(Text("Group"))
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif

