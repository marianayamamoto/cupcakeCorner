//
//  ContentView.swift
//  CupcakeCorner
//
//  Created by Mariana Yamamoto on 1/19/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var observedOrder = ObservedOrder()

    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Select your cake type", selection: $observedOrder.order.type) {
                        ForEach(Order.types.indices) {
                            Text(Order.types[$0])
                        }
                    }

                    Stepper("Number of cakes: \(observedOrder.order.quantity)", value: $observedOrder.order.quantity, in: 3...20)
                }

                Section {
                    Toggle("Any special requests?", isOn: $observedOrder.order.specialRequestEnabled.animation())

                    if observedOrder.order.specialRequestEnabled {
                        Toggle("Add extra frosting", isOn: $observedOrder.order.extraFrosting)

                        Toggle("Add extra sprinkles", isOn: $observedOrder.order.addSprinkles)
                    }
                }

                Section {
                    NavigationLink {
                        AddressView(observedOrder: observedOrder)
                    } label: {
                        Text("Delivery details")
                    }
                }

            }
            .navigationTitle("Cupcake Corner")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
