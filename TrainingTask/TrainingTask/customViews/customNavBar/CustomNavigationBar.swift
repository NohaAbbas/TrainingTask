//
//  CustomNavigationBar.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/24/23.
//

import UIKit

class CustomNavigationBar: UIView {
    @IBOutlet weak var menuBar: UIButton!
    @IBOutlet weak var languageButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        let view = Bundle.main.loadNibNamed("CustomNavigationBar", owner: self)?.first as? UIView
        view?.frame = bounds
        addSubview(view!)
    }
    
}

