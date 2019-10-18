//
//  AppDelegate.swift
//  Test Data
//
//  Created by Nilrajsinh Vaghela on 17/10/19.
//  Copyright © 2019 Nilrajsinh Vaghela. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {


     var dbPath = ""

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let docPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
               print(docPath)
               
               // MARK: - copy and attach file with xcode project
               
               self.dbPath = docPath + "/Tabe.db"
               
               
               if(!FileManager.default.fileExists(atPath: self.dbPath))
               {
                   let bundleDBPath = Bundle.main.path(forResource: "Tabe", ofType: "db")
                   
                   do{
                       try FileManager.default.copyItem(atPath: bundleDBPath!, toPath: self.dbPath)
                   }
                   catch(let err as NSError)
                   {
                       print(err.localizedDescription)
                   }
                   
               }
        
        
        
        
        
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


}

