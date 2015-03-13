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
    
    var id: String!
    var StartTime: String!
    var EndTime: String!
    var FileName: String!
    var VideoPath: String!
    var kinect: String!
    var room: String!
    
    init(id:String, StartTime: String, EndTime: String, FileName: String, VideoPath: String, kinect: String, room: String ) {
        self.id = id
        self.StartTime = StartTime
        self.EndTime = EndTime
        self.FileName = FileName
        self.VideoPath = VideoPath
        self.kinect = kinect
        self.room = room
    }

}