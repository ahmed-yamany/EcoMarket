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
    
    // MARK: - @IBOutlets
    private let sections = MockData.shared.pageData
    var sectionProviders: [any SectionLayout] = []
     
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionProviders = [ProductSectionProvider(), AdsSectionProvider()]
        collectionView.delegate = self
        collectionView.dataSource = self
        registerCell()
        collectionView.collectionViewLayout = createLayout()
    }
    // MARK: - Register Cell
    
    private func registerCell() {
        collectionView.register(UINib(nibName: "HeaderView", bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "HeaderView")
        collectionView.register(UINib(nibName: AdsCollectionViewCell.cellID, bundle: nil),
                                forCellWithReuseIdentifier: AdsCollectionViewCell.cellID)
        collectionView.register(UINib(nibName: ProductListCollectionViewCell.cellID, bundle: nil),
                                forCellWithReuseIdentifier: ProductListCollectionViewCell.cellID)
    }
    
    // MARK: - create layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self else { return nil }
            return self.sectionProviders[sectionIndex].section
        }
    }
    
    private func supplementaryHeaderItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        .init(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                heightDimension: .estimated(50)),
              elementKind: UICollectionView.elementKindSectionHeader,
              alignment: .top)
    }
}

extension HomeTheme1VC: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        sectionProviders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sectionProviders[section].itemsCount
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        return sectionProviders[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return sectionProviders[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        return sectionProviders[indexPath.section].collectionView(collectionView,
                                                                  viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
}
