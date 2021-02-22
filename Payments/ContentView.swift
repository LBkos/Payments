//
//  ContentView.swift
//  Payments
//
//  Created by Константин Лопаткин on 22.02.2021.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: ViewModel
    var body: some View {
        if viewModel.success {
            ListView(model: viewModel)
        } else {
            SinInView(model: viewModel)

        }
    }
}
