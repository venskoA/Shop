//
//  WorkView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 27.06.22.
//

import SwiftUI

struct AuthMainView: View {

    @State var userData: UserData 

    @State var complit: Bool = true

    var body: some View {
        NavigationView {
            ZStack {
                Color
                    .indigo
                    .edgesIgnoringSafeArea(.all)

                if userData.id == 0 {
                    VStack {
                        LoginView(dataModel: $userData,
                                  presenter: LoginPresenter())
                        
                        NavigationLink {
                            RegistChangeView(userData: $userData,
                                             presenter: RegistrationPresenter())
                        } label: {
                            HStack {
                                Spacer(minLength: 30)
                                Text("Regist")
                                    .font(.caption)
                                    .padding()
                            }
                        }
                    }
                } else {
                    AccountView(userData: $userData,
                                presenter: AccountPresent())
                }
            }
        }
        .foregroundColor(.white)
    }
}

struct WorkView_Previews: PreviewProvider {
    static var previews: some View {

        let dataModel = UserData(id: 0, firstName: "aa", lastName: "bcnsdn", login: "dsbnkj",  password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")

        let presenter = StartPresenter()
        @State var valueBool = true

        let view = AuthMainView(userData: dataModel)

        return view
    }
}
