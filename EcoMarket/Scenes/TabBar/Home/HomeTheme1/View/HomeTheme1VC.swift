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
    var sectionProviders: [any SectionLayout] = []
    let sectionFactory = SectionLayoutFactory()
     
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        setupUI()
        setupCollectionView()
        
        let sections = Section.samples
        sections.forEach { section in
            let sectionLayout = sectionFactory.makeSection(section: section)
            self.sectionProviders.append(sectionLayout)
        }
        
        collectionView.reloadData()
    }
    
    // MARK: - CollectionView Setup
    private func setupUI() {
        view.backgroundColor = AppColor.backgroundColor
    }
    
    private func setupCollectionView() {
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.collectionViewLayout = createLayout()
    }
    
    // MARK: - Register Cell
    
    private func registerCell() {
        collectionView.registerNib(AdsCollectionViewCell.self)
        collectionView.registerNib(NewArrivalsCollectionView.self)
        collectionView.register(UINib(nibName: HeaderView.identifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.identifier)
    }
    
    // MARK: - Create Layout
    private func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, layoutEnvironment in
//            guard let self = self else { return nil }
            return self?.sectionProviders[sectionIndex].section(sectionIndex, layoutEnvironment: layoutEnvironment)
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
