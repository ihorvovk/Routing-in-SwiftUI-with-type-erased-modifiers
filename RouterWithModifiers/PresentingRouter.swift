//
//  PresentingRouter.swift
//  RouterWithModifiers
//
//  Created by Ihor Vovk on 20.09.2020.
//

import Foundation

class PresentingRouter: Router, PresentingRouterProtocol {
    
    func presentDetails(text: String) {
        let router = Router(isPresented: isNavigating)
        navigateTo (
            PresentedView(text: text, router: router)
        )
    }
}

