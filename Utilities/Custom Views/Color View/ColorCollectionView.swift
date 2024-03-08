//
//  ColorCollectionView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 07/03/2024.
//

import UIKit

// MARK: - SizeCollectionViewDelegate Protocol
//
protocol ColorCollectionViewDelegate: AnyObject {
    func colorView(_ colorView: ColorCollectionView, didSelect color: UIColor, cell: UICollectionViewCell, at indexPath: Int)
}

class ColorCollectionView: UICollectionView {
    // MARK: - Properties
    var colors: [UIColor] = []
    var selectedButton: UIColor?
    weak var colorCollectionDelegate: ColorCollectionViewDelegate?
    
    // MARK: - Initialization
    //
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setColors(colors: [UIColor]) {
        self.colors = colors
        configureCollectionView()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            self.selectedButton = colors.first
            self.reloadData()
        }
    }
    
    /// setting up and configuring the UICollectionView
    private func configureCollectionView() {
        backgroundColor = .clear
        register(ColorCollectionViewCell.self, forCellWithReuseIdentifier: ColorCollectionViewCell.identifier)
        collectionViewLayout = createCompositionalLayout()
        delegate = self
        dataSource = self
        showsVerticalScrollIndicator = false
        reloadData()
    }
    
    // MARK: - Compositional Layout
    
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { _, _  in
            let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(20), heightDimension: .absolute(20))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            // Group
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(20), heightDimension: .estimated(20))
            let group = NSCollectionLayoutGroup.vertical(layoutSize: groupSize, subitem: item, count: 1)
            
            // Section
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 15
            
            return section
        }
    }
}

// MARK: - UICollectionViewDataSource and UICollectionViewDelegate
//
extension ColorCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: ColorCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
            Logger.log("Failed to load CustomRoundedCell", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        guard let color = colors[safe: indexPath.row] else {
            Logger.log("Failed to get color at indexPath \(String(describing: indexPath))", category: \.default, level: .fault)
            return UICollectionViewCell()
        }
        
        if selectedButton == color {
            cell.updateSelected()
            colorCollectionDelegate?.colorView(self, didSelect: color, cell: cell, at: indexPath.item)
        } else {
            cell.updateUnSelected()
        }
        cell.setupColor(color)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        selectedButton = colors[indexPath.row]
        collectionView.reloadData()
    }
}
