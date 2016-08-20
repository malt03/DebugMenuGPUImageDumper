//
//  AppDelegate.swift
//  DebugMenuGPUImageDumper
//
//  Created by Koji Murata on 05/28/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import DebugMenuGPUImageDumper
import DebugHead

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  
  func applicationDidFinishLaunching(_ application: UIApplication) {
    DebugHead.sharedInstance.prepare(menuClasses: [DebugMenuGPUImageDumper.self])
  }
}

