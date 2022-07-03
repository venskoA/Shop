//
//  WorkView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 27.06.22.
//

import SwiftUI

struct WorkView: View {
    
    var logout = FactoryLogin().configFactory(caseFactory: .logout)
    @State var dataModel: EnterModel
    var presenter: StartPresenterProtocol
    @Binding var presntNewView: Bool
    @State var navigLink = false
    
    var body: some View {
        NavigationView {
            HStack {
                NavigationLink(isActive: $navigLink) {
                    RegistView(dataModel: dataModel, navigationLink: $navigLink)
                } label: {
                    Text("regist")
                }
            }
            .navigationBarItems(trailing:
                                    Text("Logout")
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
            })
        }
    }
}

struct WorkView_Previews: PreviewProvider {
    static var previews: some View {

        let dataModel = EnterModel(id: 123, userName: "aa", password: "123", email: "ooo@gmail.com", gender: .mail, creditCards: "98980-99090-900", bio: "---")

        let presenter = StartPresenter()
        @State var valueBool = true

        let view = WorkView(dataModel: dataModel, presenter: presenter, presntNewView: $valueBool)

        return view
    }
}
