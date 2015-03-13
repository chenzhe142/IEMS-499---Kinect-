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
    
    
    var id: String!
    
    var inputStartTime:String! //= "2015-01-10 00:00:00"
    var inputEndTime:String! //= "2015-02-11 00:00:00"
    var instarttime: Int? //= 20150110000000
    var inendtime: Int? //= 20150211000000
    
    
    //store queried information
    var data: NSArray = []
    var arrayOfVideo: [VideoRecord] = [VideoRecord]()
    
    //test data for custom cell
    let tableData = ["One","Two","Three"]
    var arrayOfResults: [result] = [result]()

    
    //test ui for movieView
    var moviePlayer: MPMoviePlayerController!
    
    
    //view constraint, use to adjust the view when rotating screen.
    @IBOutlet weak var videoViewTrailingConstraint: NSLayoutConstraint!
    @IBOutlet weak var videoViewBottomConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var resultViewTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var resultViewLeadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var searchParametersViewTrailingConstraint: NSLayoutConstraint!
    
    
    //ui label, show search parameters
    @IBOutlet weak var roomLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    
    //ui view
    @IBOutlet weak var resultTableView: UITableView!
    @IBOutlet weak var videoView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //input sanity check
        if self.inputStartTime == " " {
            self.inputStartTime = "1990-01-10 00:00:00"
        }
        if self.inputEndTime == " " {
            self.inputEndTime = "2050-01-10 00:00:00"
        }
        if self.id == " " {
            self.id = "0"
        }
        
        //show parameters at the top of search result view
        roomLabel.text = "Room: " + self.id
        timeLabel.text = "Time: " + self.inputStartTime + " - " + self.inputEndTime

        
        //get json data
        data = dataOfJson("http://129.105.36.214/iosserver.php?id=\(self.id)&StartTime=\(self.inputStartTime)&EndTime=\(self.inputEndTime)")
        
        self.setUpVideoRecord()
    }
    
    
    ////////////////////////////////////////////////
    // This part is for querying data from server
    //
    // Method: Json
    //
    ////////////////////////////////////////////////
    
    // Store data in a dictionary
    func setUpVideoRecord() {
        
        // Loop through each dictionary in the array
        for onedata in data {
            
            let dictionary:[String:String] = onedata as [String:String]
            
            var videoRecord = VideoRecord(id: dictionary["id"]!, StartTime: dictionary["StartTime"]!, EndTime: dictionary["EndTime"]!, FileName: dictionary["FileName"]!, VideoPath: dictionary["VideoPath"]!, kinect: dictionary["kinect"]!, room: dictionary["room"]!)
            
            println(videoRecord)
            self.arrayOfVideo.append(videoRecord)
            
        }
        
        // println(self.messagesArray)
        
    }
    
    // Convert TIME to be purely numbers
    func processString(oldStr: String) -> Int {
        
        var newStr = ""
        
        for ch in oldStr {
            if String(ch)>="0" && String(ch)<="9"{
                newStr = newStr+String(ch)
            }
        }
        
        var timenumber = newStr.toInt()
        
        return timenumber!
    }
    
    func dataOfJson(url: String) -> NSArray {
        
        var url = url.stringByReplacingOccurrencesOfString(" ", withString: "%20")
        
        println(url)
        
        var data = NSData(contentsOfURL: NSURL(string: url)!)
        
        return (NSJSONSerialization.JSONObjectWithData(data!, options: nil, error: nil) as NSArray)
    }
    
    ////////////////////////////////////////////////
    // end of querying server
    ////////////////////////////////////////////////
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    ////////////////////////////////////////////////
    //
    // this function is used to adjust the constraints
    // of each subview
    //
    // set both portrait and landscape
    ////////////////////////////////////////////////
    
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
    
    
    
    //////////////////////////////////////////////////
    //
    // this part is for table view
    //
    // Method: create a custom cell
    //         use custom cell to show data
    //
    // Also created a "Play Video" button using 
    // -> editActionsForRowAtIndexPath
    //
    //////////////////////////////////////////////////
    
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int
    {
        return self.arrayOfVideo.count;
    }
    
    func tableView(tableView: UITableView!,
        cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell!
    {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell") as ResultTableViewCell
        //let singleResult = arrayOfResults[indexPath.row]
        
        let videorecord = self.arrayOfVideo[indexPath.row]
        cell.setCell(videorecord.kinect, startTimeText: videorecord.StartTime, endTimeText: videorecord.EndTime, videoPathText: videorecord.VideoPath, fileNameText: videorecord.FileName, roomNumberText: videorecord.room)
        
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
        
        let playVideoClosure = { (action: UITableViewRowAction!, indexPath: NSIndexPath!) -> Void in
            var result1: VideoRecord = self.arrayOfVideo[indexPath.row]
            
            println(result1.VideoPath)
            println("play video")
            
            //set moviePlayer path, using the path in result1
            var baseurl = result1.VideoPath.stringByReplacingOccurrencesOfString("./", withString: "webfile/")
            baseurl = "http://129.105.36.214/" + baseurl
            var playurl:NSURL = NSURL(string: baseurl)!
            
            self.moviePlayer = MPMoviePlayerController(contentURL: playurl)
            
            //set moviePlayer
            self.moviePlayer.view.frame = self.videoView.bounds
            self.moviePlayer.scalingMode = MPMovieScalingMode.AspectFit
            self.moviePlayer.controlStyle = MPMovieControlStyle.Embedded
            self.moviePlayer.shouldAutoplay = true
            
            self.videoView.addSubview(self.moviePlayer.view)
            self.moviePlayer.prepareToPlay()
            self.moviePlayer.play()
        }
        
        let playVideoAction = UITableViewRowAction(style: .Default, title: "Play Video", handler: playVideoClosure)
        
        playVideoAction.backgroundColor = UIColor(red: 0.4157, green: 0.212, blue: 0.5373, alpha: 1.0)
        
        return [playVideoAction];
    }

    
    //test sample data
    func setupResults() {
        var result1 = result(kinectNumber: 0, startTime: "20202020", endTime: "2020202", videoPath: "blank")
        arrayOfResults.append(result1)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //if segue.identifier == "show" {
            
            if (self.resultTableView.indexPathForSelectedRow() != nil){
                
                var index = self.resultTableView.indexPathForSelectedRow()?.row
                var record:VideoRecord! = self.arrayOfVideo[index!]
                
                if record != nil {
                    
                    // Declare a var of manipulate ViewController
                    var detailEventViewController: DetailEventViewController = segue.destinationViewController as DetailEventViewController
                    
                    detailEventViewController.id = "id: " + record.id
                    detailEventViewController.startTime = "From: " + record.StartTime
                    detailEventViewController.endTime = "To: " + record.EndTime
                    detailEventViewController.fileName = "File name: " + record.FileName
                    detailEventViewController.room = "Room: " + record.room
                    detailEventViewController.kinectNumber = "Kinect: " + record.kinect
                    
                    println(detailEventViewController.kinectNumber)
                    
                }
            }
        //}
        
        
        
        
        
        // send the text to ViewController
        
    }

    
}

