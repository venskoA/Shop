//
//  StartView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 14.06.22.
//

import SwiftUI

struct StartView: View {

    @State var dataModel: EnterModel
    var presenter: StartPresenterProtocol

    @State var presntNewView = false
    
    var login = FactoryLogin().configFactory(caseFactory: .login)
    var logout = FactoryLogin().configFactory(caseFactory: .logout)

    var body: some View {
        if !presntNewView {
            ZStack {
                Image("3")
                    .resizable()

                VStack {
                    Group {
                        TextField("Enter name", text: $dataModel.userName)
                        TextField("Enter password", text: $dataModel.password)

                    }
                    .frame(height: 35)
                    .cornerRadius(30)
                    .background(.white)
                    .foregroundColor(.black)
                    .padding(20)

                    Button(action: {
                        login
                            .load(data: dataModel) { result in
                                switch result {
                                case .success(let data):
                                    let decod = presenter.decodLogin(data: data)
                                    switch decod {
                                    case .success(let finalDecod):
                                        presntNewView = presenter.checkValue(data: finalDecod)
                                    case .failure(let err):
                                        print(err)
                                    }
                                case .failure(let error):
                                    print(error)
                                }
                            }
                    }, label: {
                        Text("Enter")
                    })
                }
            }
        } else {
            Text("Exit")
                .onTapGesture {
                    logout.load(data: dataModel) { result in
                        switch result {
                        case .success(let data):
                            let decod = presenter.decodLogout(data: data)
                            presntNewView = presenter.checkValueLogout(data: decod)
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
        }
    }
}

struct StartView_Previews: PreviewProvider {
    static var previews: some View {
        let dataModel = EnterModel(id: 123, userName: "aa", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")

        let presenter = StartPresenter()

        let view = StartView(dataModel: dataModel, presenter: presenter)

        return view
    }
}
