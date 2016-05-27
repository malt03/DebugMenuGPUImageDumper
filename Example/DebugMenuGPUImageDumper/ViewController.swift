//
//  ViewController.swift
//  DebugMenuGPUImageDumper
//
//  Created by Koji Murata on 05/28/2016.
//  Copyright (c) 2016 Koji Murata. All rights reserved.
//

import UIKit
import GPUImage
import DebugMenuGPUImageDumper

class ViewController: UIViewController {
  private var previewView: GPUImageView {
    return view as! GPUImageView
  }
  
  private let videoCamera = GPUImageVideoCamera(sessionPreset: AVCaptureSessionPresetHigh, cameraPosition: .Back)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    GPUImageDumper.sharedInstance.appendRootInstance(videoCamera)
    
    videoCamera.outputImageOrientation = .Portrait
    
    let filter0 = GPUImageToonFilter()
    let filter1 = GPUImageMonochromeFilter()
    
    videoCamera.addTarget(filter0)
    filter0.addTarget(filter1)
    filter1.addTarget(previewView)
    
    videoCamera.startCameraCapture()
  }
}
