//
//  AccountView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import SwiftUI

struct AccountView: View {
    @Binding var userData: UserData
    let presenter: PresenterNetworkProtocol
    @State var errorMessage = ""

    var body: some View {
        ZStack(alignment: .topLeading) {
            Color
                .teal
                .edgesIgnoringSafeArea(.all)

            VStack(alignment: .leading, spacing: 30) {
                HStack(alignment: .top, spacing: 30) {
                    Image("3")
                        .resizable()
                        .frame(width: 100, height: 100, alignment: .center)
                        .cornerRadius(50)
                    VStack(alignment: .leading, spacing: 10) {
                        Text(userData.userName)
                        Text(userData.creditCards)
                        Text(userData.bio)
                    }
                }

                if !errorMessage.isEmpty {
                    Text(errorMessage)
                }

                HStack {
                    NavigationLink {
                        RegistChangeView(userData: $userData,
                                         presenter: ChangePresenter())
                    } label: {
                        Text("Change Data")
                    }

                    Spacer(minLength: 40)

                    Button {
                        presenter.response(userData) { message in
                            userData.id = 0
                           errorMessage = message
                        }
                    } label: {
                        Text("Logout")
                    }
                }
            }
            .padding()
        }
        .foregroundColor(.black)
    }
}

struct AccountView_Previews: PreviewProvider {


    static var previews: some View {
        @State var userData = UserData(id: 123,
                                       userName: "aa",
                                       password: "123",
                                       email: "ooo@gmail.com",
                                       gender: .mail,
                                       creditCards: "98980-99090-900", bio: "---")

        return AccountView(userData: $userData, presenter: AccountPresent())
    }
}
