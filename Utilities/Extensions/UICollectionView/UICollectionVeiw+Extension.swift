//
//  UICollectionVeiw+Extension.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

extension UICollectionView{
    
    func registerNib<Cell: UICollectionViewCell>(cell: Cell.Type){
        let nibName = String(describing: Cell.self)
        self.register(UINib(nibName: nibName, bundle: nil), forCellWithReuseIdentifier: nibName)
    }
    
    func dequeue<Cell: UICollectionViewCell>(indexPath: IndexPath) -> Cell{
        let identifire = String(describing: Cell.self)
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as? Cell else {fatalError("Error in cell")}
        return cell
    }
}
