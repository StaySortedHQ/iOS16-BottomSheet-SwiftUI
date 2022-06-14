//
//  ContentView.swift
//  iOS16-BottomSheet-SwiftUI
//
//  Created by Leo Tumwattana on 15/6/2022.
//

import SwiftUI

extension PresentationDetent {
    static var closed: PresentationDetent = .height(60)
    static var opened: PresentationDetent = .height(400)
}

struct ContentView: View {
    
    @State private var isPresented: Bool = true
    @State private var selectedDetent: PresentationDetent = .closed
    
    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()
                .sheet(isPresented: $isPresented) {
                    VStack {
                        
                        // Tapping this button changes selectedDetent.
                        // Expect that the detent to update to binded value,
                        // however, currently this does nothing.
                        Button("Toggle Sheet Detent") {
                            if selectedDetent == .opened {
                                selectedDetent = .closed
                                let _ = print("Should close: selectedDetent value: \(selectedDetent)")
                            } else {
                                selectedDetent = .opened
                                let _ = print("Should open: selectedDetent value: \(selectedDetent)")
                            }
                        }
                        Spacer()
                    }
                    .padding(.top, 32)
                    .presentationDetents(
                        [.closed, .opened],
                        selection: $selectedDetent
                    )
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
