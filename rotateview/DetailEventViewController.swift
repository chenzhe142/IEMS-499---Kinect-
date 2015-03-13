//
//  DetailEventViewController.swift
//  kinect
//
//  Created by 陈喆 on 15/3/13.
//  Copyright (c) 2015年 Zhe Chen. All rights reserved.
//

import UIKit

class DetailEventViewController: UIViewController {
    
    ///////////////////////////////////////////////////////
    //
    // using these variables to
    // receive data from viewController
    //
    ///////////////////////////////////////////////////////
    var id: String!
    var startTime: String!
    var endTime: String!
    var fileName: String!
    var room: String!
    var kinectNumber: String!

    
    ///////////////////////////////////////////////////////
    // UI components
    ///////////////////////////////////////////////////////
    @IBOutlet weak var idTextField: UILabel!
    @IBOutlet weak var timeTextField: UILabel!
    @IBOutlet weak var timeContinuedTextField: UILabel!
    @IBOutlet weak var fileNameTextField: UILabel!
    @IBOutlet weak var roomTextField: UILabel!
    @IBOutlet weak var kinectNumberTextField: UILabel!

    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.idTextField.text = self.id
        self.timeTextField.text = self.startTime
        self.timeContinuedTextField.text = self.endTime
        self.fileNameTextField.text = self.fileName
        self.roomTextField.text = self.room
        self.kinectNumberTextField.text = self.kinectNumber
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
