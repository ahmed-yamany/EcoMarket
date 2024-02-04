//
//  CustomProfileView.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 04/02/2024.
//

import UIKit

@IBDesignable
class CustomProfileView: UIView {
    // MARK: - Properties
    //
    var data: [ProfileModel] = []
    
    // MARK: - Outlets
    //
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        setupUI()
    }
    
    // MARK: - UI Setup
    
    /// Sets up the UI components of the view.
    private func setupUI() {
        configureTableView()
        customizeAppearance()
    }
    
    /// Configures the  UITableView.
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.backgroundColor = AppColor.backgroundColor
        tableView.isScrollEnabled = false
        tableView.register(UINib(nibName: ProfileTableViewCell.identifier, 
                                 bundle: nil), 
                           forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    /// Customizes the appearance of the view.
    private func customizeAppearance() {
        backgroundColor = AppColor.backgroundColor
        layer.cornerRadius = 15
        layer.borderWidth = 1
        layer.borderColor = AppColor.textFieldUnderLine.cgColor
    }
    
    /// Loads the view from a nib file and adds it as a subview to the OnboardingTextField view.
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
           let view = loadedViews.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        // swiftlint:enable all
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
//
extension CustomProfileView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: ProfileTableViewCell = tableView.dequeue(indexPath: indexPath) else {
            return UITableViewCell()
        }
        cell.setup(profile: data[indexPath.row])
        return cell
    }
}
