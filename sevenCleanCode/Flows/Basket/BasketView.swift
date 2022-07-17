//
//  BasketView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 12.07.22.
//

import SwiftUI

struct BasketView: View {
    @ObservedObject var presenter = BasketPresenter()

    var body: some View {
        VStack {
            Text("Refsech")
                .onTapGesture {
                    presenter.featchBaskey()
                }
            list
            Text(presenter.errorMessage)
            Text("Pay \(presenter.totalPrice)")
                .onTapGesture {
                    presenter.payForProducts()
                }
                .padding()
        }
    }
}

extension BasketView {
    var list: some View {
        List(presenter.goods) { good in
            VStack(alignment: .trailing) {
                HStack {
                    if let imageLocal = good.image {
                        Image(imageLocal)
                            .resizable()
                            .frame(width: 100, height: 100, alignment: .center)
                            .cornerRadius(20)
                    } else {
                        Image(systemName: "pencil.slash")
                            .resizable()
                            .frame(width: 50, height: 50, alignment: .center)
                            .cornerRadius(10)
                    }

                    VStack(alignment: .leading, spacing: 5) {
                        Text(good.productName)
                            .font(.title3)
                        Text(good.description ?? "")
                            .lineLimit(3)
                        HStack {
                            Spacer()
                            Text("quantitu: \(String(good.quantity))")
                                .font(.caption)
                        }
                        Text("from \(String(good.price))")
                    }
                    .padding()
                }
                .padding()

                Text("Remove")
                    .onTapGesture {
                        presenter.removeProducts(idProduct: good.idProduct)
                    }
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
    }
}
