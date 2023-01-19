//
//  AppDelegate.swift
//  PendoDemo
//
//  Created by Ondřej Stašek on 19.01.2023.
//

import UIKit
import Pendo

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        let appKey = "eyJhbGciOiJSUzI1NiIsImtpZCI6IiIsInR5cCI6IkpXVCJ9.eyJkYXRhY2VudGVyIjoiZXUiLCJrZXkiOiIzMTQxNWE0YzYwODg3NzljN2RhMjJmOWYyZDZlMDQxNzdlYzU0YjQ4N2E5OTNkODJlNmUxNWNkNWQ0ZGUzYjVlOGI2YzIxZWQwZmQyYjY2OWFlMTI5ZmU0OGU3Njk5ZTk1MDIzMTYyMmYyNTdkODdmMzhkM2E0MDYxNDg0NGI2ZC4xMjIxN2IxMGIxZWEwYTAwZGNlZmMxNmY5YzM4OWUwNi5iZjkzMjEzMTQ4NGQ0MTA4NGJlMjQzNzc5MmEwM2E3NGUwNDhjYTk2ZGFlZDI4ODUzNDIwOGQ5MWRjYzg1ZTI2In0.Xx-la5UCHyc8_LzBImCqQGj5PbcEm1gr2zm0JK70saAp8UvBGd1_Ti6ewSFYCKUFltg81MSLxt7YZXMlh4oYTO-oyT5voMDBm2wWdFs0ypj6dnL8T_kVuzetYYk7F2dfgDr5GkWDVaboKAAgc6XrZcaQ6j9xOkl0gDCwfBBEjlc"
        PendoManager.shared().setup(appKey)

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    open

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        if url.scheme?.range(of: "pendo") != nil {
            PendoManager.shared().initWith(url)
        }
        return true
    }

}

