//
//  AppDelegate.swift
//  V2RayC
//
//  Created by cedric on 2018/8/25.
//  Copyright © 2018年 cedric. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    @IBOutlet weak var updateSubscribeButton: NSMenuItem!
    @IBOutlet weak var preferenceItem: NSMenuItem!

    // MARK: - Main Menu Event
    @IBAction func updateSubscribe(_ sender: NSMenuItem) {
        ProxyListManager.shared.clearAllSubscibe()
        _ = ProxyListManager.shared.subscribeURLs.map { (url) -> Void in
            fetchProxyModelsFrom(url: url)
        }
    }
    
    @IBAction func menuPreferencesClicked(_ sender: NSMenuItem) {
        if let window = NSApp.mainWindow {

        }
    }

    // MARK: - Life Cycle
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillFinishLaunching(_ notification: Notification) {
        // 创建Launch要用到的文件夹
        if !FileManager.default.fileExists(atPath: kV2rayConfigFolderPath) {
            let path = Bundle.main.path(forResource: "initLaunchPath", ofType: "sh")
            _ = runShell(shellFilePath: path!)
        }
        // 从本地读取保存的代理
        ProxyListManager.shared.loadFromDisk()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}
