//
//  ResultTableViewCell.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit
import QuartzCore

class ResultTableViewCell: UITableViewCell {
    
    


    @IBOutlet weak var kinectNumber: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var roomNumber: UILabel!

    
    var videoFilePath: String = "blank"
    var fileName: String = "blank space"



    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(kinectNumberText: String, startTimeText: String, endTimeText: String, videoPathText: String, fileNameText: String, roomNumberText: String) {
        
        self.kinectNumber.text = "Kinect: " + kinectNumberText
        self.startTime.text = "Time: " + startTimeText + " - " + endTimeText
        self.roomNumber.text = "Room: " + roomNumberText
        
        
        self.videoFilePath = videoPathText
        self.fileName = fileNameText
    }
}
