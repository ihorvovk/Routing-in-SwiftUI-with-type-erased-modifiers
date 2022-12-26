//
//  FullScreenModifier.swift
//  RouterWithModifiers
//
//  Created by Aggelos Papamichail on 27/12/22.
//

import SwiftUI

struct FullScreenModifier: ViewModifier {
    
    @Binding var presentingView: AnyView?
    
    func body(content: Content) -> some View {
        content
            .fullScreenCover(isPresented: Binding(
                get: { self.presentingView != nil },
                set: { if !$0 {
                    self.presentingView = nil
                }})
            ) {
                self.presentingView
            }
    }
}
