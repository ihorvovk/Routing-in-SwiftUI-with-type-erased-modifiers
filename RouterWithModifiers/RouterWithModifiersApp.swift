//
//  RouterWithModifiersApp.swift
//  RouterWithModifiers
//
//  Created by Ihor Vovk on 20.09.2020.
//

import SwiftUI

@main
struct RouterWithModifiersApp: App {
    var body: some Scene {
        WindowGroup {
            PresentingView(router: PresentingRouter(isPresented: .constant(false)))
        }
    }
}
