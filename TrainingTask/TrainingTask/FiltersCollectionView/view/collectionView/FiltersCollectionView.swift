//
//  FiltersCollectionView.swift
//  TrainingTask
//
//  Created by SoftXpert on 2/4/23.
//

import UIKit

class FiltersCollectionView: UICollectionView {

    var collectionArray = [String]()
    var selectedFilterPosition = 0
    
    var filtersDelegate: FiltersCollectionViewProtocol?

    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupFiltersCollectionView()
    }
    
    func configureWith(array: [String]) {
        collectionArray = array
        reloadData()
    }

    private func setupFiltersCollectionView() {
        register(UINib(nibName: FiltersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER)
        delegate = self
        dataSource = self
    }
    
}

extension FiltersCollectionView: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionArray.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
        cell.setup(with: collectionArray[indexPath.item], at: indexPath.item, lastSelected: selectedFilterPosition)
        
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterPosition = indexPath.item
        filtersDelegate?.filterCellClicked(selectedFilterPosition: selectedFilterPosition)
        reloadData()

    }

}
