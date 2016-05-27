//
//  DebugMenuGPUImageDumper.swift
//  Pods
//
//  Created by Koji Murata on 2016/05/28.
//
//

import DebugHead

public class DebugMenuGPUImageDumper: UIViewController, DebugMenu {
  public static let debugMenuTitle = "GPUImage Dumper"
  public static var debugMenuAccessoryType = UITableViewCellAccessoryType.DisclosureIndicator
  public static var debugMenuDangerLevel = DebugMenuDangerLevel.Low
  public static func debugMenuSelected(debugHead: UIView, debugMenuTableViewController: UITableViewController) -> UIViewController? {
    return DebugMenuGPUImageDumper()
  }
  
  private let scrollView = UIScrollView()
  
  override public func viewWillAppear(animated: Bool) {
    super.viewWillAppear(animated)
    
    view.backgroundColor = .whiteColor()
    
    let label = UILabel()
    label.textAlignment = .Left
    label.numberOfLines = -1
    let text = GPUImageDumper.sharedInstance.dumpAll()
    print(text)
    label.text = text
    label.sizeToFit()
    
    scrollView.contentSize = label.frame.size
    
    view.addSubview(scrollView)
    scrollView.addSubview(label)
  }
  
  override public func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    scrollView.frame = CGRect(origin: .zero, size: view.frame.size)
  }
}