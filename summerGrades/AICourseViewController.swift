//
//  AICourseViewController.swift
//  summerGrades
//
//  Created by Tad Scritchfield on 5/19/15.
//  Copyright (c) 2015 Tad Scritchfield. All rights reserved.
//

import Cocoa

class AICourseViewController: NSViewController
{
    //Outlets for each of the discussion forum fields
    //in AI view controller
    @IBOutlet weak var df1Field: NSTextField!
    @IBOutlet weak var df2Field: NSTextField!
    @IBOutlet weak var df3Field: NSTextField!
    @IBOutlet weak var df4Field: NSTextField!
    @IBOutlet weak var df5Field: NSTextField!
    @IBOutlet weak var df6Field: NSTextField!
    @IBOutlet weak var df7Field: NSTextField!
    @IBOutlet weak var df8Field: NSTextField!
    @IBOutlet weak var df9Field: NSTextField!
    @IBOutlet weak var df10Field: NSTextField!
    
    //Outlets for each of the written assignment fields
    //in AI view controller
    @IBOutlet weak var wa1Field: NSTextField!
    @IBOutlet weak var wa2Field: NSTextField!
    @IBOutlet weak var wa3Field: NSTextField!
    @IBOutlet weak var wa4Field: NSTextField!
    @IBOutlet weak var wa5Field: NSTextField!
    
    //Outlets for each of the midterm and final fields
    //in AI view controller
    @IBOutlet weak var midtermField: NSTextField!
    @IBOutlet weak var finalField: NSTextField!
    
    @IBOutlet weak var weightedGradeText: NSTextField!
    @IBOutlet weak var finalGradeText: NSTextField!
    
    @IBOutlet weak var gradeButton: NSButton!
    
    let dfPercent = 10.0
    let waPercent = 40.0
    let midtermPercent = 30.0
    let finalPercent = 20.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gradeButton.target = self
        gradeButton.action = Selector("gradeClass")
        gradeButton.keyEquivalent = "\r"
    }
    
    //Takes all the fields and produces a final grade in finalGradeText
    func gradeClass()
    {
        var percentSum: Double = 0
        
        var dfValues = [Double](count: 10, repeatedValue: 0.0)
        dfValues[0] = df1Field.doubleValue
        dfValues[1] = df2Field.doubleValue
        dfValues[2] = df3Field.doubleValue
        dfValues[3] = df4Field.doubleValue
        dfValues[4] = df5Field.doubleValue
        dfValues[5] = df6Field.doubleValue
        dfValues[6] = df7Field.doubleValue
        dfValues[7] = df8Field.doubleValue
        dfValues[8] = df9Field.doubleValue
        dfValues[9] = df10Field.doubleValue
        
        var discussionForumGrade = dfValues[0] + dfValues[1]
        discussionForumGrade += dfValues[2] + dfValues[3]
        discussionForumGrade += dfValues[4] + dfValues[5]
        discussionForumGrade += dfValues[6] + dfValues[7]
        discussionForumGrade += dfValues[8] + dfValues[9]
        discussionForumGrade /= 10
        println(discussionForumGrade)
        discussionForumGrade = discussionForumGrade * dfPercent
        println(discussionForumGrade)
        
        for var index = 0; index < 10; index++
        {
            if (dfValues[index] > 0.0)
            {
                percentSum += 1
            }
        }
        
        var waValues = [Double](count: 5, repeatedValue: 0.0)
        waValues[0] = wa1Field.doubleValue
        waValues[1] = wa2Field.doubleValue
        waValues[2] = wa3Field.doubleValue
        waValues[3] = wa4Field.doubleValue
        waValues[4] = wa5Field.doubleValue
        
        let writtenAssignmentGrade = ((waValues[0] + waValues[1] + waValues[2] + waValues[3] + waValues[4]) / 5) * waPercent
        
        for var index = 0; index < 5; index++
        {
            if (waValues[index] > 0.0)
            {
                percentSum += 8
            }
        }
        
        let midtermValue = (midtermField.doubleValue) * midtermPercent
        let finalValue = (finalField.doubleValue) * finalPercent
        
        if (midtermValue > 0.0)
        {
            percentSum += 30
        }
        if (finalValue > 0.0)
        {
            percentSum += 20
        }
        
        let finalGrade = (discussionForumGrade + writtenAssignmentGrade + midtermValue + finalValue) / 100
        let actualGrade = finalGrade / (percentSum / 100)
        
        weightedGradeText.stringValue = "Weighted Grade: \(finalGrade)%"
        finalGradeText.stringValue = "Final Calculated Grade: \(actualGrade)%"
        println("PercentSum: \(percentSum)")
        println("Final Grade: \(finalGrade)")
    }
    
    
    
    
}