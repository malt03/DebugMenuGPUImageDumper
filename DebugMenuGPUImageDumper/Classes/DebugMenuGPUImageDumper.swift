//
//  DebugMenuGPUImageDumper.swift
//  Pods
//
//  Created by Koji Murata on 2016/05/28.
//
//

import DebugHead

open class DebugMenuGPUImageDumper: UIViewController, DebugMenu {
  open static let debugMenuTitle = "GPUImage Dumper"
  open static var debugMenuAccessoryType = UITableViewCellAccessoryType.disclosureIndicator
  open static var debugMenuDangerLevel = DebugMenuDangerLevel.low
  open static func debugMenuSelected(_ debugHead: UIView, debugMenuTableViewController: UITableViewController) -> UIViewController? {
    return DebugMenuGPUImageDumper()
  }
  
  fileprivate let scrollView = UIScrollView()
  
  override open func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    view.backgroundColor = .white
    
    let label = UILabel()
    label.textAlignment = .left
    label.numberOfLines = -1
    let text = GPUImageDumper.sharedInstance.dumpAll()
    print(text)
    label.text = text
    label.sizeToFit()
    
    scrollView.contentSize = label.frame.size
    
    view.addSubview(scrollView)
    scrollView.addSubview(label)
  }
  
  override open func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    scrollView.frame = CGRect(origin: .zero, size: view.frame.size)
  }
}
