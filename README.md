# SideBarMenuController

[![CI Status](http://img.shields.io/travis/Chenglu Li/SideBarMenuController.svg?style=flat)](https://travis-ci.org/Chenglu Li/SideBarMenuController)
[![Version](https://img.shields.io/cocoapods/v/SideBarMenuController.svg?style=flat)](http://cocoapods.org/pods/SideBarMenuController)
[![License](https://img.shields.io/cocoapods/l/SideBarMenuController.svg?style=flat)](http://cocoapods.org/pods/SideBarMenuController)
[![Platform](https://img.shields.io/cocoapods/p/SideBarMenuController.svg?style=flat)](http://cocoapods.org/pods/SideBarMenuController)

## Usage

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Then simply import the framework:
```swift
import SideBarMenuController
```
Now you have a subclass of UIViewController called SideBarMenuController. To implement the class, you can either make your target viewController a subclass of SideBarMenuController, like this:
```swift
class ViewController: SideBarMenuController {
    // Get your storyboard reference. We will need it to put your (main and left)viewControllers 
    // into the SideBarMenuController
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Initialize the viewController with the required designated init method
    required init?(coder aDecoder: NSCoder) {
        
        let leftViewController = storyBoard.instantiateViewControllerWithIdentifier("Red")
        let mainViewController = storyBoard.instantiateViewControllerWithIdentifier("Green")
        
        super.init(leftViewController: leftViewController, mainViewController: mainViewController, overlap: 100)
    }
}
```
Or you could simply create an instance of SideBarMenuController and attach to your current viewController:
```swift
class ViewController: UIViewController{
  let sideBarMenuController: SideBarMenuController!
  
  override func viewDidLoad(){
    super.viewDidLoad()
    sideBarMenuController = SideBarMenuController(init method here)
  }
}
```

![Demo GIF](https://cloud.githubusercontent.com/assets/14342440/13861155/c46004ea-ec59-11e5-945f-b4a82feef76f.gif)

## Requirements

## Installation

SideBarMenuController is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SideBarMenuController"
```

## Author

Chenglu Li, kabelee92@gmail.com

## License

SideBarMenuController is available under the MIT license. See the LICENSE file for more info.
