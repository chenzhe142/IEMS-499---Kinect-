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
    
    

    @IBOutlet weak var roomNumber: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var videoPath: UILabel!
    
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
    
    func setCell(roomNumberText: String, startTimeText: String, endTimeText: String, videoPathText: String, fileNameText: String) {
        
        self.roomNumber.text = roomNumberText
        self.startTime.text = startTimeText
        self.endTime.text = endTimeText
        self.videoPath.text = videoPathText
        self.videoFilePath = videoPathText
        self.fileName = fileNameText
    }
}
