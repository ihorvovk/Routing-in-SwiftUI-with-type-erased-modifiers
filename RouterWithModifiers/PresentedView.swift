//
//  PresentedView.swift
//  RouterWithModifiers
//
//  Created by Ihor Vovk on 20.09.2020.
//

import SwiftUI

struct PresentedView: View {
    
    private let text: String
    private let router: Router
    
    init(text: String, router: Router) {
        self.text = text
        self.router = router
    }
    
    var body: some View {
        Button {
            router.dismiss()
        } label: {
            Text(text)
                .padding()
        }
    }
}

struct PresentedView_Previews: PreviewProvider {
    static var previews: some View {
        PresentedView(text: "Text", router: Router(isPresented: .constant(true)))
    }
}
