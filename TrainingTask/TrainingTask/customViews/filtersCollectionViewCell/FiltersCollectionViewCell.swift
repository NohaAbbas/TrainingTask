//
//  FiltersCollectionViewCell.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/24/23.
//

import UIKit

class FiltersCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var filterView: UIView!
    @IBOutlet weak var filterLabel: UILabel!
    
    override var isSelected: Bool {
        didSet {
            isSelected ? selectFilter() : unselectFilter()
        }
    }
    
    static let IDENTIFIER = "FiltersCollectionViewCell"
    
    func setup(with filter: String) {
        filterLabel.text = filter
        filterLabel.sizeToFit()
        filterView.layer.masksToBounds = false
        filterView.layer.cornerRadius = 4
    }
    
    func selectFilter() {
        filterLabel.textColor = UIColor.white
        filterView.backgroundColor = UIColor(red: 21/255, green: 188/255, blue: 177/255, alpha: 1)
    }
    
    func unselectFilter() {
        filterLabel.textColor = UIColor.darkGray
        filterView.backgroundColor = UIColor.systemGray5
    }
}

