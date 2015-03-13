//
//  result.swift
//  rotateview
//
//  Created by 陈喆 on 15/3/11.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import Foundation

class result {
    
    var kinectNumber = 0
    var startTime = "blank"
    var endTime = "blank"
    var videoPath = "blank"
    var roomNumber = "0"
    
    init(kinectNumber: Int, startTime: String, endTime: String, videoPath: String) {

        self.kinectNumber = kinectNumber
        self.startTime = startTime
        self.endTime = endTime
        self.videoPath = videoPath
        
    }
}