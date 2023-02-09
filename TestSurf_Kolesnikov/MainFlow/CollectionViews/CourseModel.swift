//
//  CourseModel.swift
//  TestSurf_Kolesnikov
//
//  Created by Sergey Kolesnikov on 08.02.2023.
//

import Foundation

struct CourseModel {
    
    let course: String
    var pressed = false
    
    static func getCourses() -> [CourseModel] {
        let coureses: [CourseModel] = [
            CourseModel(course: "IOS"),
            CourseModel(course: "Android"),
            CourseModel(course: "Design"),
            CourseModel(course: "QA"),
            CourseModel(course: "PM"),
            CourseModel(course: "Flutter"),
            CourseModel(course: "Fishing"),
            CourseModel(course: "Trecking"),
            CourseModel(course: "Box"),
            CourseModel(course: "Simracing")
        ]
        
        return coureses
    }
}
