# DebugMenuGPUImageDumper

[![Platform](https://img.shields.io/cocoapods/p/DebugMenuGPUImageDumper.svg?style=flat)](http://cocoapods.org/pods/DebugMenuGPUImageDumper)
![Language](https://img.shields.io/badge/language-Swift%202.2-orange.svg)
[![CocoaPods](https://img.shields.io/cocoapods/v/DebugMenuGPUImageDumper.svg?style=flat)](http://cocoapods.org/pods/DebugMenuGPUImageDumper)
![License](https://img.shields.io/github/license/malt03/DebugMenuGPUImageDumper.svg?style=flat)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

### Output Example
```
<GPUImageVideoCamera: 0x156570ff0>
└<GPUImageToonFilter: 0x156645c00>
　└<GPUImageMonochromeFilter: 0x156646370>
　　└<GPUImageView: 0x156584ee0; frame = (0 0; 375 667); autoresize = W+H; layer = <CAEAGLLayer: 0x156585130>>
```

## Usage

### Initialize
```swift
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
  DebugHead.sharedInstance.prepare(menuClasses: [DebugMenuGPUImageDumper.self])
  return true
}
```

### Initialize root GPUImage instance
```swift
GPUImageDumper.sharedInstance.appendRootInstance(videoCamera)
```

or

```swift
class MyGPUImageVideoCamera: GPUImageVideoCamera {
  override init() {
    super.init()
    GPUImageDumper.sharedInstance.appendRootInstance(self)
  }
}
```

## Installation

DebugMenuGPUImageDumper is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "DebugMenuGPUImageDumper"
```

## Author

Koji Murata, malt.koji@gmail.com

## License

DebugMenuGPUImageDumper is available under the MIT license. See the LICENSE file for more info.
