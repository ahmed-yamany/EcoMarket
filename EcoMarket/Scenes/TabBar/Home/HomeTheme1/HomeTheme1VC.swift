//
//  HomeTheme1VC.swift
//  EcoMarket
//
//  Created by Mohamed Khaled on 13/01/2024.
//

import UIKit

enum SectionType: Codable {
    case adds, newArrival
}

class SectionLayoutFactory {
    func makeSetion(section: Section) -> any SectionLayout {
        switch section.type {
            case .adds: AdsSectionProvider(data: section.adds ?? [])
            case .newArrival: NewArrivalsSectionProvider(data: section.newArrivarProducts ?? [])
        }
    }
}

struct Section: Codable {
    let type: SectionType
    let header: String
    var newArrivarProducts: [ProductModel]?
    var adds: [Adds]?
}

extension Section {
    static let samples: [Section] = [
        Section(type: .adds, header: "For You", adds: Adds.samples),
        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples),
//        Section(type: .adds, header: "For You", adds: Adds.samples),
//        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples),
//        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples),
//        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples),
//        Section(type: .newArrival, header: "New Arrival", newArrivarProducts: ProductModel.samples),
//        Section(type: .adds, header: "For You", adds: Adds.samples),
//        Section(type: .adds, header: "For You", adds: Adds.samples),
//        Section(type: .adds, header: "For You", adds: Adds.samples)
    ]
}

class HomeTheme1VC: UIViewController {
    
    // MARK: - @IBOutlets
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Properties
    
    // Array to store section providers conforming to SectionLayout protocol
    var sectionProviders: [any SectionLayout] = []
    
    let sectionFactory = SectionLayoutFactory()
     
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
//        sectionProviders = [AdsSectionProvider(), NewArrivalsSectionProvider()]
        let sections = Section.samples
        sections.forEach { section in
            var sectionlayout = sectionFactory.makeSetion(section: section)
            self.sectionProviders.append(sectionlayout)
        }
        
        // Set up the compositional layout
        collectionView.collectionViewLayout = createLayout()
        collectionView.reloadData()
    }
    
    // MARK: - Register Cell
    
    private func registerCell() {
        // Register header view
        collectionView.registerNib(AdsCollectionViewCell.self)
        collectionView.registerNib(NewArrivalsCollectionView.self)
        collectionView.register(UINib(nibName: HeaderView.identifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderView.identifier)
//        collectionView.registerSupplementaryView(HeaderView.self)
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
