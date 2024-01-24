//
//  HomeTheme1VC.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

class HomeTheme1VC: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    // Array to store section providers conforming to SectionLayout protocol
    var sectionProviders: [any SectionLayout] = []
     
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupCollectionView()
    }
    
    // MARK: - CollectionView Setup
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        // Initialize section providers for Ads and New Arrivals
        sectionProviders = [AdsSectionProvider(), NewArrivalsSectionProvider()]
        
        // Set up the compositional layout
        collectionView.collectionViewLayout = createLayout()
    }
    
    // MARK: - Register Cell
    
    private func registerCell() {
        // Register header view
        collectionView.register(UINib(nibName: HeaderView.cellID, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.cellID)
        
        // Register AdsCollectionViewCell
        collectionView.register(UINib(nibName: AdsCollectionViewCell.cellID, bundle: nil),
                                forCellWithReuseIdentifier: AdsCollectionViewCell.cellID)
        
        // Register NewArrivalsCollectionViewCell
        collectionView.register(UINib(nibName: NewArrivalsCollectionView.cellID, bundle: nil),
                                forCellWithReuseIdentifier: NewArrivalsCollectionView.cellID)
    }
    
    // MARK: - Create Layout
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil }
            return self.sectionProviders[sectionIndex].section
        }
    }
}

extension HomeTheme1VC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // MARK: - UICollectionViewDataSource
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionProviders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionProviders[section].itemsCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sectionProviders[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    // MARK: - UICollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sectionProviders[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    // MARK: - Supplementary View
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        return sectionProviders[indexPath.section].collectionView(collectionView,
                                                                  viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
