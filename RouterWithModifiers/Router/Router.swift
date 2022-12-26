//
//  Coordinator.swift
//  RouterWithModifiers
//
//  Created by Ihor Vovk on 02.09.2020.
//

import SwiftUI

class Router: ObservableObject {
    
    struct State {
        var navigating: AnyView? = nil
        var presentingSheet: AnyView? = nil
        var presentingFullScreen: AnyView? = nil
        var isPresented: Binding<Bool>
    }
    
    @Published private(set) var state: State
    
    init(isPresented: Binding<Bool>) {
        state = State(isPresented: isPresented)
    }
}

extension Router {
    
    func navigateTo<V: View>(_ view: V) {
        state.navigating = AnyView(view)
    }
    
    func presentSheet<V: View>(_ view: V) {
        state.presentingSheet = AnyView(view)
    }
    
    func presentFullScreen<V: View>(_ view: V) {
        state.presentingFullScreen = AnyView(view)
    }
    
    func dismiss() {
        state.isPresented.wrappedValue = false
    }
}

extension Router {
    
    var isNavigating: Binding<Bool> {
        boolBinding(keyPath: \.navigating)
    }
    
    var isPresentingSheet: Binding<Bool> {
        boolBinding(keyPath: \.presentingSheet)
    }
    
    var isPresentingFullScreen: Binding<Bool> {
        boolBinding(keyPath: \.presentingFullScreen)
    }
    
    var isPresented: Binding<Bool> {
        state.isPresented
    }
}

private extension Router {
    
    func binding<T>(keyPath: WritableKeyPath<State, T>) -> Binding<T> {
        Binding(
            get: { self.state[keyPath: keyPath] },
            set: { self.state[keyPath: keyPath] = $0 }
        )
    }
    
    func boolBinding<T>(keyPath: WritableKeyPath<State, T?>) -> Binding<Bool> {
        Binding(
            get: { self.state[keyPath: keyPath] != nil },
            set: {
                if !$0 {
                    self.state[keyPath: keyPath] = nil
                }
            }
        )
    }
}

extension View {
    
    func navigation(_ router: Router) -> some View {
        self.modifier(NavigationModifier(presentingView: router.binding(keyPath: \.navigating)))
    }
    
    func sheet(_ router: Router) -> some View {
        self.modifier(SheetModifier(presentingView: router.binding(keyPath: \.presentingSheet)))
    }
    
    func fullScreen(_ router: Router) -> some View {
        self.modifier(FullScreenModifier(presentingView: router.binding(keyPath: \.presentingFullScreen)))
    }
}
