//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Mariana Yamamoto on 1/28/22.
//

import SwiftUI

struct CheckoutView: View {
    @ObservedObject var order: Order

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)

                Text("Your total is \(order.cost, format: .currency(code: "USD"))")
                Button("Place Order", action: { })
                    .padding()
            }
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView(order: Order())
    }
}
