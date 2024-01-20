//
//  CategoryViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit
import Combine

class CategoryViewController: UITableViewController {
    
    private(set) var viewModel: CategoryViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    init (viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        binding()
    }
    
    private func configTableView() {
        tableView.backgroundColor = AppColor.backgroundColor
        tableView.separatorStyle = .none
        tableView.register(CategoryTableViewCell.self, forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    private func binding() {
        viewModel.$categories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.getData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier,
                                                       for: indexPath) as? CategoryTableViewCell else {
            print("Error")
            return UITableViewCell()
        }
        cell.setup(category: viewModel.categories[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        cell.backgroundColor = AppColor.primaryButton
        cell.contentView.layer.cornerRadius = 20
        cell.contentView.layer.masksToBounds = true
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = AppColor.backgroundColor
        
        let label = UILabel()
        label.text = "Categories"
        label.textColor = AppColor.primaryText
        label.font = UIFont.h2
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 16),
            label.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
        ])
        
        return headerView
    }
    
}

protocol Identifiable {}
extension Identifiable {
    static var identifier: String {
        return String(describing: self.self)
    }
}

extension UITableViewCell: Identifiable {
    
}
