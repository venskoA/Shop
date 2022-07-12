//
//  GoodDescription.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 10.07.22.
//

import SwiftUI

struct GoodDescription: View {
    @State var good: GoodsModel
    @ObservedObject var presenter: GoodDescriptionPresenter

    @State var showAlert = true
    @State var reviewTextField = "Good product"
    @State var amountProduct = 1
    @State var showError = ""

    var body: some View {
        VStack(alignment: .center) {
            topView
            centerView
            bottomView
        }
        .alert("Add review",
               isPresented: $showAlert,
               actions: {
            TextField("Enter your review", text: $reviewTextField)
            SecureField("Enter your rewiew", text: $reviewTextField)
            Button(action: {
                let userId = UserDefault.shared.userData?.id ?? 0
                presenter.responceAddReview(idUser: userId,
                                            idGood: good.idProduct,
                                            text: reviewTextField) {

                }
            }) {
                Text("ok")
            }
            Button(role: .cancel) {} label: {
                Text("Cancel")
            }
        },
               message: {
            Text("Other review")
        })
        .padding()
    }
}

extension GoodDescription {
    var topView: some View {
        HStack(alignment: .center) {
            if good.image != nil {
                Image(good.image!)
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .cornerRadius(20)
            } else {
                Image(systemName: "pencil.slash")
                    .resizable()
                    .frame(width: 50, height: 50, alignment: .center)
                    .cornerRadius(10)
            }

            VStack(alignment: .leading, spacing: 20) {
                Text(good.productName)
                    .font(.title3)
                    .lineLimit(3)
                HStack {
                    Text("from \(String(good.price))")
                    Spacer()
                    Text("quantitu: \(String(good.quantity ?? 0))")
                        .font(.caption)
                }
                Text(good.description ?? "")
            }
            .padding()
        }
    }

    var centerView: some View {
        VStack {
            HStack {
                HStack {
                    Image(systemName: "scribble.variable")
                    Text("Add review")
                }
                .onTapGesture {
                    showAlert.toggle()
                }

                Spacer()

                HStack {
                    Image(systemName: "plus.rectangle.portrait")
                    Text("Add product")
                }
                .onTapGesture {
                    if good.quantity ?? 0 > 0 {
                    presenter.addProductInBasket(idProduct: good.idProduct,
                                                 quantity: amountProduct)
                    }
                }
                Picker("Amount", selection: $amountProduct) {
                    ForEach(0..<(good.quantity ?? 0)) {
                        Text("\($0)")
                    }
                }
            }
            .padding()

            if !presenter.addReview.isEmpty {
                Text("\(presenter.addReview)")
                    .animation(.easeIn(duration: 3))
            }
        }
    }

    var bottomView: some View {
        List(presenter.listReview) { review in
            Text("\(review.text)")
                .onTapGesture {
                    presenter.responceRemoveReview(idComment: review.idReview)
                }
        }
    }
}


struct GoodDescription_Previews: PreviewProvider {
    static var previews: some View {
        let good = GoodsModel(id: UUID() ,
                              idProduct: 112,
                              productName: "Phone",
                              price: 3223,
                              quantity: 122,
                              image: "3",
                              description: "This is a new phone. Number one in world. It has a big screen and has height cpu")
        GoodDescription(good: good, presenter: GoodDescriptionPresenter(idGood: 1))
    }
}
