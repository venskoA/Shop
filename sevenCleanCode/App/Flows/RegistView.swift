//
//  RegistView.swift
//  sevenCleanCode
//
//  Created by Andrey Vensko on 27.06.22.
//

import SwiftUI

struct RegistView: View {

    @State var dataModel: EnterModel

    var regist = RegisterRequest(configUrl: ConfURLAll(ConfigURLLogin()))

    @State var valuePicker = 0
    var gender: [Gender] = [Gender.mail, Gender.femail]

    @State var errorRegist = ""
    @Binding var navigationLink: Bool

    var body: some View {
        ZStack(alignment: .top) {
            Rectangle()
                .background(.cyan)
                .foregroundColor(.cyan)
            VStack {

                TextField("", text: $dataModel.userName)
                TextField("", text: $dataModel.password)
                TextField("", text: $dataModel.email)
                Picker("Color", selection: $valuePicker) {
                    ForEach(0..<gender.count) {
                        Text("\(gender[$0].rawValue)")
                    }
                }
                .pickerStyle(.segmented)

                TextField("", text: $dataModel.creditCards)
                TextField("", text: $dataModel.bio)

                Button {
                    regist.load(data: dataModel) { result in
                        switch result {
                        case .success(_):
                            errorRegist = "registration completed"
                            navigationLink = false
                        case .failure(let error):
                            errorRegist = "\(error)"
                        }
                    }
                } label: {
                    Text("Regist")
                }

                if !errorRegist.isEmpty {
                    Text(errorRegist)
                }

            }
            .padding()
        }
        .onAppear {
            dataModel.gender = gender[valuePicker]
        }
    }
}




