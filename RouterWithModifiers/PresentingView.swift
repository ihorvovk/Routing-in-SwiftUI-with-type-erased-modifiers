//
//  PresentingView.swift
//  RouterWithModifiers
//
//  Created by Ihor Vovk on 20.09.2020.
//

import SwiftUI

protocol PresentingRouterProtocol: Router {
    func presentDetails(text: String)
}

struct PresentingView<R: PresentingRouterProtocol>: View {
    
    @StateObject private var router: R
    
    init(router: R) {
        _router = StateObject(wrappedValue: router)
    }
    
    var body: some View {
        NavigationView {
            Button(action: {
                router.presentDetails(text: "Details")
            }) {
                Text("Present Details")
                    .padding()
            }.navigation(router)
        }.sheet(router)
    }
}

struct PresentingView_Previews: PreviewProvider {
    static var previews: some View {
        PresentingView(router: PresentingRouter(isPresented: .constant(false)))
    }
}
