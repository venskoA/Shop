//
//  ErrorView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import SwiftUI

struct AbstractErrorView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.gray)
            Text("Error")
        }
    }
}

struct AbstractErrorView_Previews: PreviewProvider {
    static var previews: some View {
        AbstractErrorView()
    }
}
