//
//  PruebaTecnicaSuraApp.swift
//  PruebaTecnicaSura
//
//  Created by Gil CasRam on 16/11/22.
//

import SwiftUI
import FirebaseCore

@main
struct YourApp: App {

  @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

  var body: some Scene {
    WindowGroup {
        let viewModel = LogInViewMoel()
          FirstView()
              .environmentObject(viewModel)
    }
  }
}

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
