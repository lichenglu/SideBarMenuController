//
//  ViewController.swift
//  SideBarMenuController
//
//  Created by Chenglu Li on 03/17/2016.
//  Copyright (c) 2016 Chenglu Li. All rights reserved.
//

import UIKit
import SideBarMenuController

class ViewController: SideBarMenuController {
    
    let storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let greenViewController = self.mainViewController as! GreenController
        greenViewController.delegate = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        let leftViewController = storyBoard.instantiateViewControllerWithIdentifier("Red")
        let mainViewController = storyBoard.instantiateViewControllerWithIdentifier("Green")
        
        super.init(leftViewController: leftViewController, mainViewController: mainViewController, overlap: 100)
    }
}

extension ViewController: GreenViewControllerDelegate{
    
    func GreenViewController(didTapMenuButton viewController: UIViewController){
        self.toggleLeftMenuAnimated(true)
    }
}
