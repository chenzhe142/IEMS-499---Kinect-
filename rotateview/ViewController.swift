//
//  ViewController.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit
import MediaPlayer

class ViewController: UIViewController, UITableViewDelegate {
    
    //test data for custom cell
    let tableData = ["One","Two","Three"]
    var arrayOfResults: [result] = [result]()

    
    //test ui for movieView
    @IBOutlet weak var testPlayer: UIButton!
    var moviePlayer: MPMoviePlayerController!
    
    
    //view constraint, use to adjust the view when rotating screen.
    @IBOutlet weak var videoViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoViewBottomConstraint: NSLayoutConstraint!
    
    
    @IBOutlet weak var resultViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchParametersViewTrailingConstraint: NSLayoutConstraint!
    
    
    
    //ui view
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //set up video player path
        let url = NSURL(string: "http://129.105.36.214/index2.php?StartTime=2015-02-13%2000:00:00&EndTime=2015-02-23%2023:00:00")
        var error: NSError?
        let html = NSString(contentsOfURL: url!, encoding: NSUTF8StringEncoding, error: &error)
        
        var str = (html as String).componentsSeparatedByString("<br>")
        //println(str)
        
        var url_1: String = str[1]
        url_1 = (url_1 as NSString).substringFromIndex(1)
        //println(url_1)
        
        var baseurl = "http://129.105.36.214/webfile"
        baseurl = baseurl + url_1
        println(baseurl)
        
        var playurl:NSURL = NSURL(string: baseurl)!
        
        moviePlayer = MPMoviePlayerController(contentURL: playurl)
        
        
        
        //add data to arrayOfResults
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
            videoViewTrailingConstraint.constant = (viewWidth/2.0) - (padding)
            videoViewBottomConstraint.constant = 0
            
            moviePlayer.view.frame = self.videoView.bounds
            
            searchParametersViewTrailingConstraint.constant = (viewWidth/2.0) - (padding)
            
            resultViewLeadingConstraint.constant = (viewWidth/2.0) - (padding)
            resultViewTopConstraint.constant = 0
            
        } else { // else portrait
            videoViewBottomConstraint.constant = (viewHeight/2.0)
            videoViewTrailingConstraint.constant = -padding
            
            moviePlayer.view.frame = self.videoView.bounds
            
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
        
        cell.playVideo.tag = indexPath.row
        cell.playVideo.addTarget(self, action: "playVideoInCell", forControlEvents: UIControlEvents.TouchUpInside)
        
        let singleResult = arrayOfResults[indexPath.row]
        
        cell.setCell(singleResult.kinectNumber, startTimeText: singleResult.startTime, endTimeText: singleResult.endTime, videoPathText: singleResult.videoPath)
        
        

        
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            //objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
    
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [AnyObject]? {
        
        var moreRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Play", handler:{action, indexpath in
            println("PLAY•ACTION");
        });
        moreRowAction.backgroundColor = UIColor(red: 0.298, green: 0.851, blue: 0.3922, alpha: 1.0);
        
        var deleteRowAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "Delete", handler:{action, indexpath in
            println("DELETE•ACTION");
        });
        
        return [deleteRowAction, moreRowAction];
    }

    
    
    func setupResults() {
        var result1 = result(kinectNumber: 0, startTime: "20202020", endTime: "2020202", videoPath: "blank")
        arrayOfResults.append(result1)
    }
    
    
    @IBAction func playMovie(sender: UIButton) {
        moviePlayer.view.frame = self.videoView.bounds
        moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
        moviePlayer.controlStyle = MPMovieControlStyle.Embedded
        moviePlayer.shouldAutoplay = true
        
        videoView.addSubview(moviePlayer.view)
        moviePlayer.prepareToPlay()
        moviePlayer.play()
    }
    
    func playVideoInCell(sender: AnyObject) {
        
        var button: UIButton = sender as UIButton;
        
        //use the tag to index the array
        let result1: result = arrayOfResults[button.tag]
        
        var videoPath : String = result1.videoPath
        print(videoPath)
    }

    
    
}

