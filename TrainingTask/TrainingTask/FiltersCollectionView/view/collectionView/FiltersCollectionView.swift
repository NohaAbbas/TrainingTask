//
//  FiltersCollectionView.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/4/23.
//

import UIKit

class FiltersCollectionView: UICollectionView {

    var filters = Filters.allCases.map {$0.description}
    var selectedFilterPosition = 0
    
    var filtersDelegate: FiltersCollectionViewProtocol?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupFiltersCollectionView()
    }
    

    private func setupFiltersCollectionView() {
        register(UINib(nibName: FiltersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER)
        delegate = self
        dataSource = self
    }
    
}

extension FiltersCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
        cell.setup(with: filters[indexPath.item], at: indexPath.item, lastSelected: selectedFilterPosition)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterPosition = indexPath.item
        filtersDelegate?.filterCellClicked(selectedFilterPosition: selectedFilterPosition)
        reloadData()

    }

}
