//
//  SurveillerVotrePoidsApp.swift
//  SurveillerVotrePoids
//
//  Created by MACBOOKAIR on 17/07/2021.
//

import SwiftUI
import UIKit
import Firebase
@main
struct SurveillerVotrePoidsApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self)
    var delegate
    var body: some Scene {
        WindowGroup {
            LoginUI()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions:
        [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
      return true
    }
}
