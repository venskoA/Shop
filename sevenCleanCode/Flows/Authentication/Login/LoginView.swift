//
//  LoginView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 9.07.22.
//

import SwiftUI

struct LoginView: View {
    @Binding var dataModel: UserData
    let presenter: PresenterNetworkProtocol
    @State var errorText: String = ""
    
    var body: some View {
        VStack {
            Group {
                TextField("Enter name", text: $dataModel.userName)
                SecureField("Enter password", text: $dataModel.password)
            }
            .frame(height: 35)
            .cornerRadius(30)
            .background(.white)
            .foregroundColor(.black)
            .padding(20)
            
            Button {
                presenter.response(dataModel) { message in
                    errorText = message
                    dataModel = UserDefault.shared.userData ?? dataModel
                }
            } label: {
                Text("Enter")
                    .font(.largeTitle)
            }
            
            Text(errorText)
                .font(.title3)
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        @State var dataModel = UserData(id: 0, userName: "aa", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")
        
        let presenter = LoginPresenter()
        
        let view = LoginView(dataModel: $dataModel, presenter: presenter)
        
        return view
    }
}
