//
//  ViewController.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let tableData = ["One","Two","Three"]
    
    var arrayOfResults: [result] = [result]()


    @IBOutlet weak var videoViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoViewBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var resultViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultViewLeadingConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var searchParametersViewTrailingConstraint: NSLayoutConstraint!
    
    
    
    
    @IBOutlet weak var resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        self.setupResults()
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
            
            searchParametersViewTrailingConstraint.constant = (viewWidth/2.0)
            
            resultViewLeadingConstraint.constant = (viewWidth/2.0)
            resultViewTopConstraint.constant = 0
            
        } else { // else portrait
            videoViewBottomConstraint.constant = (viewHeight/2.0)
            videoViewTrailingConstraint.constant = -padding
            
            searchParametersViewTrailingConstraint.constant = -padding
            
            resultViewLeadingConstraint.constant = -padding
            resultViewTopConstraint.constant = (viewHeight/2.0)
        }
    }
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayOfResults.count;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
//        let cell:UITableViewCell = UITableViewCell(style:UITableViewCellStyle.Default, reuseIdentifier:"Cell")
//        cell.textLabel?.text = tableData[indexPath.row]
//        
//        return cell
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as ResultTableViewCell
        
        let singleResult = arrayOfResults[indexPath.row]
        
        cell.setCell(singleResult.kinectNumber, startTimeText: singleResult.startTime, endTimeText: singleResult.endTime, videoPathText: singleResult.videoPath)
        
        
        return cell
    }

    
    
    func setupResults() {
        var result1 = result(kinectNumber: 0, startTime: "20202020", endTime: "2020202", videoPath: "blank")
        arrayOfResults.append(result1)
    }
    
    
}

