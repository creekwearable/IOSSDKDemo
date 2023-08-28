//
//  AppDelegate.swift
//  CreekSDKDemo
//
//  Created by bean on 2023/6/27.
//

import UIKit
import BackgroundTasks
import CreekSDK



@main
class AppDelegate: UIResponder, UIApplicationDelegate ,UNUserNotificationCenterDelegate{
    
    var window: UIWindow?
    var bgTask: UIBackgroundTaskIdentifier?
    var timer: Timer?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let controller = ViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController(rootViewController: controller)
        window?.makeKeyAndVisible()
        CreekInterFace.instance.initSDK()
        CreekInterFace.instance.authorization(type: 0);
        CreekInterFace.instance.autoConnect(type: 1);
        return true
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        
        if self.bgTask != nil && self.bgTask != UIBackgroundTaskIdentifier.invalid {
            return
        }
        bgTask = UIApplication.shared.beginBackgroundTask(expirationHandler: {
            self.endTask()
        })
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(self.longTimeTask(timer:)), userInfo: nil, repeats: true)
    }
    
    @objc func endTask() {
        
        if self.timer != nil || self.timer?.isValid == true {
            self.timer?.invalidate()
            self.timer=nil
            UIApplication.shared.endBackgroundTask(self.bgTask!)
            print("stop timeer...")
        }
    }
    
    @objc func longTimeTask(timer:Timer) {
        let time = UIApplication.shared.backgroundTimeRemaining
        print("\(time)")
        
   }
    
}

