//
//  DateUtils.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import Foundation

func getDateAsString(dateString: String) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
    
    let formatter = DateFormatter()
    formatter.dateFormat = "MMMM dd, YYYY"
    
    if let dateFromString = dateFormatter.date(from: dateString) {
        return formatter.string(from: dateFromString)
    }
    return ""
}

