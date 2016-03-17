//
//  GreenViewController.swift
//  SideBarMenuController
//
//  Created by chenglu li on 17/3/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import UIKit

protocol GreenViewControllerDelegate: class {
    
    func GreenViewController(didTapMenuButton viewController: UIViewController)
}

class GreenController: UIViewController {
    
    var delegate:GreenViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapMenuButton(sender: UIButton) {

        delegate?.GreenViewController(didTapMenuButton: self)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
