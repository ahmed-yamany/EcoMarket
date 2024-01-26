//
//  SizeCollectionView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 26/01/2024.
//

import UIKit

// MARK: - SizeCollectionViewDelegate Protocol
//
protocol SizeCollectionViewDelegate: AnyObject {
    func didSelect(cell: UICollectionViewCell, indexPath: Int)
    func sizeView(_ sizeView: SizeCollectionView, didSelect size: String)
}

class SizeCollectionView: UICollectionView {

    // MARK: - Properties
    //
    @IBInspectable public var defaultColor: UIColor = .white
    @IBInspectable public var selectedColor: UIColor = .black
    var sizes: [String] = []
    var selectedButton: String?
    weak var sizeCollectionDelegate: SizeCollectionViewDelegate?
    
    // MARK: - Initialization
    //
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        configureCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setLabels(sizes: [String]) {
        self.sizes = sizes
    }
    
    /// setting up and configuring the UICollectionView
    private func configureCollectionView() {
        backgroundColor = .clear
        register(CustomRoundedCell.self, forCellWithReuseIdentifier: CustomRoundedCell.identifier)
        collectionViewLayout = createCompositionalLayout()
        delegate = self
        dataSource = self
        reloadData()
    }
    
    // MARK: - Compositional Layout
    
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(40), heightDimension: .absolute(40))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(40), heightDimension: .estimated(40))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitem: item, count: 1)
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 15
        
        // Create and return a compositional layout with the defined section.
        return UICollectionViewCompositionalLayout(section: section)
    }
}

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate
//
extension SizeCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sizes.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: CustomRoundedCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Failed to load CustomRoundedCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        if selectedButton == sizes[indexPath.row] {
            cell.updateSelected(color: selectedColor)
            sizeCollectionDelegate?.didSelect(cell: cell, indexPath: indexPath.row)
        } else {
            cell.updateUnSelected(color: defaultColor)
        }
        cell.setupTitle(sizes[indexPath.row])
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedButton = sizes[indexPath.row]
        sizeCollectionDelegate?.sizeView(self, didSelect: sizes[indexPath.row])
        collectionView.reloadData()
    }
}
