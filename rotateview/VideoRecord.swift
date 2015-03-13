//
//  VideoRecord.swift
//  Kinect
//
//  Created by Junchen Quan on 15/2/24.
//  Copyright (c) 2015年 Junchen Quan. All rights reserved.
//

import Foundation

class VideoRecord {
    
    /*
    var RoomNumber: String!
    var PatientName: String!
    var Path: String!
    var StartTime: String!
    var EndTime: String!
    
    init(RoomNumber:String, PatientName: String, Path: String, StartTime: String, EndTime: String) {
        self.RoomNumber = RoomNumber
        self.PatientName = PatientName
        self.Path = Path
        self.StartTime = StartTime
        self.EndTime = EndTime
    }*/
    
    var roomNumber: String!
    var StartTime: String!
    var EndTime: String!
    var FileName: String!
    var VideoPath: String!
    
    init(roomNumber:String, StartTime: String, EndTime: String, FileName: String, VideoPath: String ) {
        self.roomNumber = roomNumber
        self.StartTime = StartTime
        self.EndTime = EndTime
        self.FileName = FileName
        self.VideoPath = VideoPath
    }

}