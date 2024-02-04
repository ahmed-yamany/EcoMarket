//
//  AlertViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 03/02/2024.
//

import UIKit

protocol RTCustomAlertDelegate: AnyObject {
    func okButtonPressed(_ alert: AlertViewController, alertTag: Int)
    func cancelButtonPressed(_ alert: AlertViewController, alertTag: Int)
}


class AlertViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var statusImageView: UIImageView!
    @IBOutlet weak var alertView: UIView!
    
    
    var alertTitle = "Title"
    var alertMessage = "Description"
    var okButtonTitle = "Ok"
    var alertTag = 0
    var statusImage = UIImage(systemName: "face.smiling")
    
    weak var delegate: RTCustomAlertDelegate?
    
    init() {
        super.init(nibName: "AlertViewController", bundle: Bundle(for: AlertViewController.self))
        self.modalPresentationStyle = .overCurrentContext
        self.modalTransitionStyle = .crossDissolve
        
    }
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAlert()
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
        delegate?.okButtonPressed(self, alertTag: alertTag)
    }
    
    func show() {
        if #available(iOS 13, *) {
            UIApplication.shared.windows.first?.rootViewController?.present(self, animated: true, completion: nil)
        } else {
            UIApplication.shared.keyWindow?.rootViewController!.present(self, animated: true, completion: nil)
        }
    }
    
    func setupAlert() {
        alertView.layer.cornerRadius = 20
        confirmButton.layer.cornerRadius = 20
//        statusImageView.contentMode = .scaleAspectFit
        
        titleLabel.text = alertTitle
        messageLabel.text = alertMessage
        statusImageView.image = statusImage
        confirmButton.setTitle(okButtonTitle, for: .normal)
    }
}
