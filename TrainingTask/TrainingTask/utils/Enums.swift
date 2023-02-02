//
//  Enums.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import Foundation

enum Filters : Int, CustomStringConvertible, CaseIterable {
    case ALL
    case BABY = 6
    case TODDLER_AND_CHILD = 25
    case MUMZ = 5
    case LIFE_STYLE = 9
    case TOP_TENS = 103
    
    var description: String {
        switch (self) {
        case .ALL:
            return "ALL"
        case .BABY:
            return "BABY"
        case .TODDLER_AND_CHILD:
            return "TODDLER & CHILD"
        case .MUMZ:
            return "MUMZ"
        case .LIFE_STYLE:
            return "LIFE STYLE"
        case .TOP_TENS:
            return "TOP TENS"
        }
    }
}

enum DateInputFormat: String {
    case FULL_DATE_TIME = "yyyy-MM-dd'T'HH:mm:ss"
}

enum DateDesiredFormat: String {
    case MONTH_DAY_YEAR = "MMMM dd, YYYY"
}
