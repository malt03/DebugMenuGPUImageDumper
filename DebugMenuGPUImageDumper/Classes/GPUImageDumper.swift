//
//  GPUImageDumper.swift
//  Pods
//
//  Created by Koji Murata on 2016/05/28.
//
//

import GPUImage

protocol DumpName {
  var dumpName: String? { get set }
}

extension GPUImageOutput {
  func dumpTargets() -> String {
    return ((self as? DumpName)?.dumpName ?? String(describing: self)) + "\n" + dumpTargets("")
  }
  
  fileprivate func dumpTargets(_ prefix: String) -> String {
    let maxIndex = targets().count - 1
    var str = ""
    for (i, child) in targets().enumerated() {
      let last = (i == maxIndex)
      let name = (child as? DumpName)?.dumpName ?? String(describing: child)
      str += prefix + (last ? "└" : "├") + name + "\n"
      if let o = child as? GPUImageOutput {
        str += o.dumpTargets(prefix + (last ? "　" : "│ "))
      }
    }
    return str
  }
}

open class GPUImageDumper {
  open static let sharedInstance = GPUImageDumper()
  fileprivate var rootInstances = [GPUImageWeakInstance]()
  
  fileprivate init() {}
  
  open func appendRootInstance(_ instance: GPUImageOutput) {
    for i in rootInstances {
      if instance === i.instance { return }
    }
    rootInstances.append(GPUImageWeakInstance(output: instance))
  }
  
  open func dumpAll() -> String {
    var str = ""
    for i in rootInstances {
      if let dump = i.instance?.dumpTargets() {
        str += dump + "\n"
      }
    }
    return str
  }
}

class GPUImageWeakInstance {
  weak var instance: GPUImageOutput?
  
  init(output: GPUImageOutput) {
    instance = output
  }
}
