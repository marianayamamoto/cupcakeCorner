//
//  AddressView.swift
//  CupcakeCorner
//
//  Created by Mariana Yamamoto on 1/28/22.
//

import SwiftUI

struct AddressView: View {
    @ObservedObject var observedOrder: ObservedOrder

    var body: some View {
        Form {
            Section {
                TextField("Name", text: $observedOrder.order.name)
                TextField("Street Address", text: $observedOrder.order.streetAddress)
                TextField("City", text: $observedOrder.order.city)
                TextField("Zip", text: $observedOrder.order.zip)
            }

            Section {
                NavigationLink {
                    CheckoutView(observedOrder: observedOrder)
                } label: {
                    Text("Check out")
                }
            }
            .disabled(!observedOrder.order.hasValidAddress)
        }
        .navigationTitle("Delivery details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AddressView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            AddressView(observedOrder: ObservedOrder())
        }
    }
}
