//
//  AssemblyLanguageCourseViewController.swift
//  summerGrades
//
//  Created by Tad Scritchfield on 5/19/15.
//  Copyright (c) 2015 Tad Scritchfield. All rights reserved.
//

import Cocoa

class ALCourseViewController: NSViewController
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
    
    //Outlets for each of the midterm and final fields
    //in AI view controller
    @IBOutlet weak var midtermField: NSTextField!
    @IBOutlet weak var finalField: NSTextField!
    
    @IBOutlet weak var weightedGradeText: NSTextField!
    @IBOutlet weak var finalGradeText: NSTextField!
    
    @IBOutlet weak var gradeButton: NSButton!
    
    let waPercent = 50.0
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
        
        var waValues = [Double](count: 10, repeatedValue: 0.0)
        waValues[0] = df1Field.doubleValue
        waValues[1] = df2Field.doubleValue
        waValues[2] = df3Field.doubleValue
        waValues[3] = df4Field.doubleValue
        waValues[4] = df5Field.doubleValue
        waValues[5] = df6Field.doubleValue
        waValues[6] = df7Field.doubleValue
        waValues[7] = df8Field.doubleValue
        waValues[8] = df9Field.doubleValue
        waValues[9] = df10Field.doubleValue
        
        var writtenAssignmentGrade = waValues[0] + waValues[1]
        writtenAssignmentGrade += waValues[2] + waValues[3]
        writtenAssignmentGrade += waValues[4] + waValues[5]
        writtenAssignmentGrade += waValues[6] + waValues[7]
        writtenAssignmentGrade += waValues[8] + waValues[9]
        writtenAssignmentGrade /= 10
        println(writtenAssignmentGrade)
        writtenAssignmentGrade = writtenAssignmentGrade * waPercent
        println(writtenAssignmentGrade)
        
        for var index = 0; index < 10; index++
        {
            if (waValues[index] > 0.0)
            {
                percentSum += 5
            }
        }
        
        
        let midtermValue = (midtermField.doubleValue) * midtermPercent
        let finalValue = (finalField.doubleValue) * finalPercent
        
        if (midtermValue > 0.0)
        {
            percentSum += 25
        }
        if (finalValue > 0.0)
        {
            percentSum += 25
        }
        
        let finalGrade = (writtenAssignmentGrade + midtermValue + finalValue) / 100
        let actualGrade = finalGrade / (percentSum / 100)
        
        weightedGradeText.stringValue = "Weighted Grade: \(finalGrade)%"
        finalGradeText.stringValue = "Final Calculated Grade: \(actualGrade)%"
        println("PercentSum: \(percentSum)")
        println("Final Grade: \(finalGrade)")
    }
}