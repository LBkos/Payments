//
//  SinInView.swift
//  PaymentsApp
//
//  Created by Константин Лопаткин on 21.02.2021.
//

import SwiftUI

struct SinInView: View {
    @ObservedObject var model: ViewModel

    var body: some View {
        NavigationView {
        VStack {
            Form {
                Section(header: Text("USERNAME")) {
                    TextField("Login", text: $model.login)
                }
                Section(header: Text("PASSWORD"), footer: Text(model.errorMessage).foregroundColor(.red)) {
                    SecureField("password", text: $model.password)
                }
            }
            Button(action: {
                model.getTokenApi(completion: { result in
                    model.tokens = result
                })
            }) {
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 60)
                    .overlay(
                        Text("Log In")
                            .foregroundColor(.white)
                    ).padding()
            }
        }
        .navigationBarTitle("Sin Up")
        }
    }
}

struct SinInView_Previews: PreviewProvider {
    static var previews: some View {
        SinInView(model: ViewModel())
    }
}
