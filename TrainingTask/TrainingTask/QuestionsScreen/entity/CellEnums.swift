//
//  CellType.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/5/23.
//

import Foundation
import UIKit


enum CellType: Int {
    case First = 0
    case Second = 1
    case Third = 2
    case Forth = 3
    case Fifth = 4
    case Sixth = 5
    
    var color: UIColor {
        switch self {
        case .First:
            return UIColor(red: 194/255, green: 242/255, blue: 236/255, alpha: 1)
        case .Second:
            return UIColor(red: 255/255, green: 229/255, blue: 206/255, alpha: 1)
        case .Third:
            return UIColor(red: 254/255, green: 237/255, blue: 242/255, alpha: 1)
        case .Forth:
            return UIColor(red: 240/255, green: 235/255, blue: 255/255, alpha: 1)
        case .Fifth:
            return UIColor(red: 255/255, green: 239/255, blue: 183/255, alpha: 1)
        case .Sixth:
            return UIColor(red: 228/255, green: 249/255, blue: 253/255, alpha: 1)
        }
    }
    
    var cornerStyle: CellCorners {
        switch self {
        case .First:
            return CellCorners.TopLeftBottomRight
        case .Second:
            return CellCorners.None
        case .Third:
            return CellCorners.TopRightBottomRight
        case .Forth:
            return CellCorners.TopRightBottomLeft
        case .Fifth:
            return CellCorners.None
        case .Sixth:
            return CellCorners.TopLeftBottomRight
        }
    }
    
    func configureCell(forView view: UIView, cornerRadius: CGFloat) {
        view.backgroundColor = color
        cornerStyle.styleCell(view: view, cornerRadius: cornerRadius)
    }

}

enum CellCorners {
    case TopLeftBottomRight
    case TopRightBottomRight
    case TopRightBottomLeft
    case None
    
    func styleCell(view: UIView, cornerRadius: CGFloat) {
        switch self {
        case .TopLeftBottomRight:
            UIHelper.roundTopLeftAndBottomRightCorners(view: view, cornerRadius: cornerRadius)
        case .TopRightBottomRight:
            UIHelper.roundTopRightAndBottomRightCorners(view: view, cornerRadius: cornerRadius)
        case .TopRightBottomLeft:
            UIHelper.roundTopRightAndBottomLeftCorners(view: view, cornerRadius: cornerRadius)
        case .None:
            return
        }
    }
}
