//
//  GoodCell.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import SwiftUI

struct GoodCellList: View {
    @State var good: GoodsModel

    var body: some View {
        ZStack(alignment: .leading) {
            HStack {
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

                VStack(alignment: .leading, spacing: 5) {
                    Text(good.productName)
                        .font(.title3)
                    Text(good.description ?? "")
                        .lineLimit(3)
                    HStack {
                        Spacer()
                        Text("quantitu: \(String(good.quantity ?? 0))")
                            .font(.caption)
                    }
                    Text("from \(String(good.price))")
                }
                .padding()
            }
            .padding()
        }
    }
}

struct GoodCell_Previews: PreviewProvider {
    static var previews: some View {
        let good = GoodsModel(id: UUID() ,
                              idProduct: 112,
                              productName: "Phone",
                              price: 3223,
                              quantity: 122,
                              image: "3",
                              description: "This is a new phone. Number one in world. It has a big screen and has height cpu")
        GoodCellList(good: good)
    }
}
