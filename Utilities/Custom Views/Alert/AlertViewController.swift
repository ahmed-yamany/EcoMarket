//
//  AlertViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 03/02/2024.
//

import UIKit

public protocol AlertInterface: AnyObject {
    func show(item: AlertItem)
}

class AlertViewController: UIViewController, AlertInterface {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
  
    var action: ActionHandler?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = AppColor.socialButton.withAlphaComponent(0.3)
        alertView.layer.cornerRadius = 20
        confirmButton.layer.cornerRadius = 20
        statusImageView.contentMode = .scaleAspectFit
        alertView.backgroundColor = AppColor.backgroundColor
        alertView.layer.shadowColor = UIColor.gray.cgColor
        alertView.layer.shadowRadius = 10
        alertView.layer.shadowOpacity = 0.5
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        action?()
    }
    
    func show(item: AlertItem) {
        titleLabel.text = item.status.title
        messageLabel.text = item.message
        statusImageView.image = item.status.image
        confirmButton.setTitle(item.buttonTitle, for: .normal)
        self.action = item.buttonAction
    }
}
