//
//  DateUtils.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/31/23.
//

import Foundation

extension String {
    
    func getDateAsString(from inputFormat: String, to outputFormat: String) -> String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = inputFormat
        
        let formatter = DateFormatter()
        formatter.dateFormat = outputFormat
        
        if let dateFromString = dateFormatter.date(from: self) {
            return formatter.string(from: dateFromString)
        }
        return ""
    }

}

