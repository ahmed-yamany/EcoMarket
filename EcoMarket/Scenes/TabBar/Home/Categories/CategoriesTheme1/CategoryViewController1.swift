//
//  CategoryViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit
import Combine

class CategoryViewController1: UITableViewController {
    
    // MARK: - Properties
    private(set) var viewModel: CategoryViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    init (viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configTableView()
        subscribedCategories()
    }
    
    // MARK: - Private Function
    /// Configures the appearance of the table view.
    private func configTableView() {
        tableView.backgroundColor = AppColor.backgroundColor
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: CategoryTableViewCell.identifier,
                                 bundle: nil),
                           forCellReuseIdentifier: CategoryTableViewCell.identifier)
    }
    
    // MARK: - Sets up Combine subscriptions to update the table view when the `viewModel.categories` change.
    private func subscribedCategories() {
        viewModel.$categories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
        
        viewModel.getData()
    }
    
    // MARK: - UITableViewDataSource & UITableViewDelegate Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CategoryTableViewCell.identifier,
                                                       for: indexPath) as? CategoryTableViewCell else {
            print("Error: Unable to dequeue CategoryTableViewCell.")
            return UITableViewCell()
        }
        cell.setup(category: viewModel.categories[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 78 /// Height of Cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        headerView.backgroundColor = AppColor.backgroundColor
        
        // Create a UILabel to display the header text
        let label = UILabel()
        label.text = "Categories"
        label.textColor = AppColor.primaryText
        label.font = UIFont.h2
        label.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(label)
        
        // Set up constraints for the label within the header view
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
