//
//  SwiftUIView.swift
//  PaymentsApp
//
//  Created by Константин Лопаткин on 21.02.2021.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var model: ViewModel
    var body: some View {
        NavigationView {
            List{
                ForEach(model.responseData!, id: \.self) { item in
                    VStack(alignment: .leading) {
                        Text("Amount: \(item.amount)")
                        Text("Created: \(item.created)")
                        Text("Currency: \(item.currency)")
                        Text("Dect: \(item.desc)")
                    }
                }
                
            
            }
            .navigationBarTitle(Text("List"))
            .navigationBarItems(trailing: Button("LogOut"){
                model.success = false
                model.login = ""
                model.password = ""
                model.errorMessage = ""
            })
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(model: ViewModel())
    }
}
