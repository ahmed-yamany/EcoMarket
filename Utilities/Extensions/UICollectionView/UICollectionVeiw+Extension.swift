//
//  UICollectionVeiw+Extension.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit
protocol Identifiable { }
extension Identifiable {
    static var identifier: String { String(describing: self.self) }
}

extension UICollectionViewCell: Identifiable {}

extension UICollectionView {
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type) {
        self.register(UINib(nibName: Cell.identifier, bundle: nil),
                      forCellWithReuseIdentifier: Cell.identifier)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell {
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as? Cell else {
            fatalError("Error in cell")
        }
        return cell
    }
}
