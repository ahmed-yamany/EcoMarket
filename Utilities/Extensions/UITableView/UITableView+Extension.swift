//
//  UITableView+Extension.swift
//  EcoMarket
//
//  Created by Ahmed Yamany on 22/01/2024.
//

import UIKit

extension UITableViewCell: Identifiable { }

extension UITableView {
    func registerFromNib(_ cell: UITableViewCell.Type) {
        register(UINib(nibName: CategoryTableViewCell.identifier, bundle: nil),
                 forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    func dequeue<Cell: UITableViewCell>(indexPath: IndexPath) -> Cell? {
        dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as? Cell
    }
}
