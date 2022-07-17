//
//  StartView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 14.06.22.
//

import SwiftUI

struct StartView: View {
    
    @State var userData: UserData = {
        guard let userdef = UserDefault.shared.userData else {
            return UserData(id: 0,
                            firstName: "",
                            lastName: "",
                            login: "",
                            password: "",
                            email: "",
                            gender: .mail,
                            creditCards: "",
                            bio: "")
        }
        return userdef
    }()
    
    @State var selectorTabView = 0

    var body: some View {
        TabView(selection: $selectorTabView) {
            NavigationView {
                Goods()
            }
            .tabItem {
                Image(systemName: "list.dash")
                Text("Categories")
            }
            .tag(0)

            BasketView()
                .tabItem {
                    Image(systemName: "arrow.up.bin.fill")
                    Text("Basket")
                }
                .tag(1)
            
            AuthMainView(userData: userData)
                .tabItem {
                    Image(systemName: "person.crop.circle.fill")
                    Text("Account")
                }
                .tag(2)
        }
    }
}



//struct StartView_Previews: PreviewProvider {
//    static var previews: some View {
//        let dataModel = UserData(id: 0, userName: "aa", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")
//
//        let presenter = StartPresenter()
//
//        let view = StartView(userData: dataModel, presenter: presenter)
//
//        return view
//    }
//}
