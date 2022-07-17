//
//  Goods.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import SwiftUI

struct Goods: View {
    
    @ObservedObject var presenter = GoodsPresenter()

    var body: some View {
            List(presenter.goods) { good in
                NavigationLink {
                    GoodDescription(good: good,
                                    presenter: GoodDescriptionPresenter(idGoods: good.idProduct))
                } label: {
                    GoodCellList(good: good)
                        .navigationTitle("Shop")
                }
            }
    }
}

struct Goods_Previews: PreviewProvider {
    static var previews: some View {
        Goods()
    }
}
