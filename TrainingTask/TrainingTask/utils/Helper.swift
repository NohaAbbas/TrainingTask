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

    func slice(from: String, to: String) -> String? {
        guard let rangeFrom = range(of: from)?.upperBound else { return nil }
        guard let rangeTo = self[rangeFrom...].range(of: to)?.lowerBound else { return nil }
        return String(self[rangeFrom..<rangeTo])
    }
    
}

