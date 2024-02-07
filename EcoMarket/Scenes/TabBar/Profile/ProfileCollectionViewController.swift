//
//  ProfileCollectionViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/02/2024.
//

import UIKit
import MakeConstraints

class ProfileCollectionViewController: UICollectionViewController {
    
    // MARK: - Initialization
    //
    init() {
        super.init(collectionViewLayout: .init())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configCollectionView()
    }
    
    // MARK: - Configuration
    //
    /// Configures the collection view properties.
    private func configCollectionView() {
        collectionView.registerNib(UserCollectionViewCell.self)
        collectionView.registerNib(ProfileCollectionViewCell.self)
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { section, _ in
            
            switch section {
            case 0:
                // Item
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                // Group
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)
                
                // Section
                let section = NSCollectionLayoutSection(group: group)
                    section.contentInsets.bottom = 30
                // Create and return a compositional layout with the defined section.
                return section
                
                case 1:
                    // Item
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    // Group
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)
                    
                    // Section
                    
                    let section = NSCollectionLayoutSection(group: group)
                    section.decorationItems = [
                        NSCollectionLayoutDecorationItem.background(elementKind: SectionDecorationView.reuseIdentifier)
                    ]
                    section.contentInsets = NSDirectionalEdgeInsets(top: 25, leading: 25, bottom: 25, trailing: 25)
                    // Create and return a compositional layout with the defined section.
                    return section
                    
                case 2:
                    // Item
                    let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
                    let item = NSCollectionLayoutItem(layoutSize: itemSize)
                    
                    // Group
                    let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50))
                    let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                    group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20)
                    
                    // Section
                    
                    let section = NSCollectionLayoutSection(group: group)
                    // Create and return a compositional layout with the defined section.
                    return section
            default:
                // For other sections, you can define different layouts or return a default layout.
                // Here, a simple vertical group layout is used as an example.
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.2))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                return section
            }
        }
        layout.register(SectionDecorationView.self, forDecorationViewOfKind: SectionDecorationView.reuseIdentifier)
        return layout
    }

    // MARK: UICollectionViewDataSource
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return UserModel.user.count
        } else if section == 1 {
            return ProfileModel.mockData1.count
        } else if section == 2 {
            return ProfileModel.mockData2.count
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.section {
            case 0:
                guard let cell: UserCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                    return UICollectionViewCell()
                }
                cell.setup(user: UserModel.user[indexPath.row])
                return cell
            case 1:
                guard let cell: ProfileCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                    return UICollectionViewCell()
                }
                cell.setup(profile: ProfileModel.mockData1[indexPath.row])
                return cell
            case 2:
                guard let cell: ProfileCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
                    return UICollectionViewCell()
                }
                cell.setup(profile: ProfileModel.mockData2[indexPath.row])
                return cell
            default:
                return UICollectionViewCell()
        }
    }
}

class SectionDecorationView: UICollectionReusableView {
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    required init?(coder: NSCoder) {
        fatalError("not implemented")
    }
    
    func configure() {
        addSubview(view)
        view.backgroundColor = AppColor.backgroundColor
        view.layer.cornerRadius = 15
        view.layer.borderWidth = 1
        view.layer.borderColor = AppColor.textFieldUnderLine.cgColor
        view.fillSuperview(padding: UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25))
    }
}

extension UICollectionReusableView {
    static var reuseIdentifier: String {
        return String(describing: Self.self)
    }
}
