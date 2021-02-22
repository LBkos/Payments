//
//  PaymentsApp.swift
//  Payments
//
//  Created by Константин Лопаткин on 22.02.2021.
//

import SwiftUI

@main
struct PaymentsAppApp: App {
    let viewModel = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
