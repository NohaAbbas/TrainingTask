//
//  ForYouViewController.swift
//  TrainingTask
//
//  Created by SoftXpert on 1/25/23.
//

import UIKit


class ForYouViewController: UIViewController {

    @IBOutlet weak var filtersCollectionView: UICollectionView!
    
    let filters = Filters.allCases.map { $0.description }
    let filtersIDs = Filters.allCases.map { $0.rawValue }
    var selectedFilterPosition = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFiltersCollectionView()
    }
    
    private func setupFiltersCollectionView() {
        filtersCollectionView.register(UINib(nibName: FiltersCollectionViewCell.IDENTIFIER, bundle: nil), forCellWithReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER)
        filtersCollectionView.dataSource = self
        filtersCollectionView.delegate = self
    }
}

extension ForYouViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        filters.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FiltersCollectionViewCell.IDENTIFIER, for: indexPath) as! FiltersCollectionViewCell
        cell.setup(with: filters[indexPath.item])
        if (selectedFilterPosition == indexPath.item) {
            cell.selectFilter()
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedFilterPosition = indexPath.item
        collectionView.reloadData()
        print(filtersIDs[indexPath.item])
    }
}
