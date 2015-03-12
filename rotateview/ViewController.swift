//
//  ViewController.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var videoViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoViewBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var resultViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultViewLeadingConstraint: NSLayoutConstraint!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func willRotateToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        let padding: CGFloat = 16.0
        
        // since we're calling this before the rotation, the height and width are swapped
        let viewHeight = self.view.frame.size.width
        let viewWidth = self.view.frame.size.height
        
        // if landscape
        if UIInterfaceOrientationIsLandscape(toInterfaceOrientation) {
            videoViewTrailingConstraint.constant = (viewWidth/2.0)
            videoViewBottomConstraint.constant = 0
            
            
            
            resultViewLeadingConstraint.constant = (viewWidth/2.0)
            resultViewTopConstraint.constant = 0
            
        } else { // else portrait
            videoViewBottomConstraint.constant = (viewHeight/2.0)
            videoViewTrailingConstraint.constant = -padding
            
            
            resultViewLeadingConstraint.constant = -padding
            resultViewTopConstraint.constant = (viewHeight/2.0)
        }
    }

}

