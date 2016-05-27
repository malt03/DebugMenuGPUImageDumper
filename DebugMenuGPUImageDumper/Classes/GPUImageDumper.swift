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
    return ((self as? DumpName)?.dumpName ?? String(self)) + "\n" + dumpTargets("")
  }
  
  private func dumpTargets(prefix: String) -> String {
    let maxIndex = targets().count - 1
    var str = ""
    for (i, child) in targets().enumerate() {
      let last = (i == maxIndex)
      let name = (child as? DumpName)?.dumpName ?? String(child)
      str += prefix + (last ? "└" : "├") + name + "\n"
      if let o = child as? GPUImageOutput {
        str += o.dumpTargets(prefix + (last ? "　" : "│ "))
      }
    }
    return str
  }
}

public class GPUImageDumper {
  public static let sharedInstance = GPUImageDumper()
  private var rootInstances = [GPUImageWeakInstance]()
  
  private init() {}
  
  public func appendRootInstance(instance: GPUImageOutput) {
    for i in rootInstances {
      if instance === i.instance { return }
    }
    rootInstances.append(GPUImageWeakInstance(output: instance))
  }
  
  public func dumpAll() -> String {
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