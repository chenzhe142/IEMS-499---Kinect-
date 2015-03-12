//
//  ResultTableViewCell.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit
import MediaPlayer

class ResultTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var kinectNumber: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var endTime: UILabel!
    @IBOutlet weak var videoPath: UILabel!
    


    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(kinectNumberInt: Int, startTimeText: String, endTimeText: String, videoPathText: String) {
        
        self.kinectNumber.text = String(kinectNumberInt)
        self.startTime.text = startTimeText
        self.endTime.text = endTimeText
        self.videoPath.text = videoPathText
    }

}
