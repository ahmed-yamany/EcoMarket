//
//  CountryViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 19/02/2024.
//

import UIKit

class CountryViewController: UIViewController {

    @IBOutlet weak var searchView: SearchView!
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = CountryViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        setupUI()
    }
    
    private func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: "CountryTableViewCell")
        
        tableView.separatorStyle = .none
        
        let headerLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 50))
        headerLabel.text = "Country or Region"
        headerLabel.font = .h2
        tableView.tableHeaderView = headerLabel
    }
    
    private func setupUI(){
        searchView.layer.borderWidth = 0.2
        searchView.layer.borderColor = AppColor.primaryText.cgColor
    }
    
}

extension CountryViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.countryArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: CountryTableViewCell = tableView.dequeue(indexPath: indexPath) else{
            return UITableViewCell()
        }
        cell.setup(country: viewModel.countryArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}
