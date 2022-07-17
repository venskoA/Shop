//
//  RegistView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 27.06.22.
//

import SwiftUI

struct RegistChangeView: View {

    @Binding var userData: UserData

    @State var valuePicker = 0
    var gender: [Gender] = [Gender.mail, Gender.femail]

    @State var errorRegist = ""

    let presenter: PresenterNetworkProtocol

    var body: some View {
        ZStack(alignment: .center) {
            Rectangle()
                .background(.mint)
                .foregroundColor(.mint)

            registLine
                .padding()
        }
        .onAppear {
            userData.gender = gender[valuePicker]
        }
    }
}

extension RegistChangeView {
    var registLine: some View {
        VStack(alignment: .center,
               spacing: 20) {
            TextField("Enter first name", text: $userData.firstName)
            TextField("Enter last name", text: $userData.lastName)
            TextField("Enter login", text: $userData.login)
            SecureField("Enter password", text: $userData.password)
            TextField("Enter email", text: $userData.email)
            Picker("Color", selection: $valuePicker) {
                ForEach(0..<gender.count) {
                    Text("\(gender[$0].rawValue)")
                }
            }
            .pickerStyle(.segmented)

            TextField("Enter creit cards", text: $userData.creditCards)
            TextField("Enter description", text: $userData.bio)

            Button {
                presenter.response(userData) { message in
                    errorRegist = message
                }
            } label: {
                Text("Get")
            }

            if !errorRegist.isEmpty {
                Text(errorRegist)
            }
        }
    }
}

struct RegistView_Previews: PreviewProvider {
    static var previews: some View {
        @State var dataModel = UserData(id: 0,
                                        firstName: "aa", lastName: "jnkf", login: "jkfnc", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")
        @State var nav = false

        let view = RegistChangeView(userData: $dataModel,
                              presenter: RegistrationPresenter())

        return view
    }
}

