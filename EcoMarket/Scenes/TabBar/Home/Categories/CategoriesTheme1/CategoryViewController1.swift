//
//  CategoryViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 20/01/2024.
//

import UIKit
import Combine
import MakeConstraints

class CategoryViewController1: UITableViewController {
    
    // MARK: - Properties
    //
    private(set) var viewModel: CategoryViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    //
    init (viewModel: CategoryViewModel) {
        self.viewModel = viewModel
        super.init(style: .plain)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    //
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        subscribedCategories()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable.forEach { $0.cancel() }
    }
    
    // MARK: - Private Function
    //
    /// Configures the appearance of the table view.
    private func configureTableView() {
        tableView.backgroundColor = AppColor.backgroundColor
        tableView.separatorStyle = .none
        tableView.registerFromNib(CategoryTableViewCell.self)
    }
    
    /// Sets up Combine subscriptions to update the table view when the `viewModel.categories` change.
    private func subscribedCategories() {
        viewModel.$categories
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.tableView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    // MARK: - UITableViewDataSource
    //
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CategoryTableViewCell = tableView.dequeue(indexPath: indexPath) else {
            Logger.log("Error: Unable to dequeue CategoryTableViewCell.", category: \.default, level: .fault)
            return UITableViewCell()
        }
        let categoryName = viewModel.categories[indexPath.row]
        let categoryDetail = viewModel.getCategoryDetail(category: categoryName )
        cell.setup(categoryName: categoryName, categoryDetail: categoryDetail )
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let category = viewModel.categories[indexPath.row]
        viewModel.showProductView(category: category)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let headerView = UIView()
        let titleLabel = UILabel()
        
        headerView.heightConstraints(44)
        headerView.backgroundColor = AppColor.backgroundColor
        headerView.addSubview(titleLabel)
        
        titleLabel.text = "Categories"
        titleLabel.textColor = AppColor.primaryText
        titleLabel.font = UIFont.h2
        
        let padding = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 0)
        titleLabel.makeConstraints(leadingAnchor: headerView.leadingAnchor,
                                   centerYAnchor: headerView.centerYAnchor, padding: padding)
        
        return headerView
    }
}
