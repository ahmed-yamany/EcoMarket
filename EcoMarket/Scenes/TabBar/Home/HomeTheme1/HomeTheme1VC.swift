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
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let sections = self.sections[sectionIndex]
            switch sections {
            case .ads:
                
                // item
                
                let item = NSCollectionLayoutItem(layoutSize:
                        .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                
                // group
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize:
                        .init(widthDimension: .absolute(260),
                              heightDimension: .absolute(160)), subitems: [item])
                
                // section
                
                let section = NSCollectionLayoutSection(group: group)
                
                // to make the cell make as collection view scrolling V
                
                section.orthogonalScrollingBehavior = .continuous
                
                // to add space between items cell
                
                section.interGroupSpacing = 20
                section.contentInsets = .init(top: 16, leading: 4, bottom: 0, trailing: 4)
                return section
            case .newArrivals:
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(328), heightDimension: .absolute(278)), subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [self.supplementaryHeaderItem()]
                return section
            }
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
        sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .ads(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AdsCollectionViewCell.cellID,
                                                                for: indexPath) as? AdsCollectionViewCell
            else {return UICollectionViewCell()}
            cell.setupUI(items[indexPath.row])
            return cell
        case .newArrivals(let items):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductListCollectionViewCell.cellID,
                                                                for: indexPath) as? ProductListCollectionViewCell
            else {return UICollectionViewCell()}
            cell.productImage.image = UIImage(named: items[indexPath.row].image)
            cell.productName.text = items[indexPath.row].title
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "HeaderView",
                                                                               for: indexPath) as? HeaderView
            else { return UICollectionReusableView() }
            header.title = sections[indexPath.section].title // Use indexPath.section instead of indexPath.row
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
}

struct Item {
    let title: String
    let image: String
}

enum ListSection {
    case ads([Item])
    case newArrivals([Item])
    
    var items: [Item] {
        switch self {
        case .ads(let items),
                .newArrivals(let items):
            return items
        }
    }
    
    var count: Int {
        return items.count
    }
    
    var title: String {
        switch self {
        case .ads:
            return ""
        case .newArrivals:
            return "New Arrivals"
        }
    }
}

struct MockData {
    static let shared = MockData()
    private let ads: ListSection = .ads([.init(title: "", image: "ads-image"),
                                         .init(title: "", image: "ads-image")
    ])
    private let newArrivals: ListSection = .newArrivals([.init(title: "Mohamed", image: "popular"),
                                                         .init(title: "", image: "popular")
    ])
    var pageData: [ListSection] {
        [ads, newArrivals]
    }
}
