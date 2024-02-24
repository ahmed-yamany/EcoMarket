//
//  CustomView.swift
//  test
//
//  Created by Ibrahim Nasser Ibrahim on 22/02/2024.
//

import UIKit

class CustomView: UIView {
    
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var circleView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNib()
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNib()
        configureUI()
    }
    
    func configureUI() {
        widthAnchor.constraint(equalToConstant: 50).isActive = true
//        circleView.layer.cornerRadius = 7
        circleView.makeCircular()
    }
    
    private func loadNib() {
        // swiftlint:disable all
        if let loadedViews = Bundle.main.loadNibNamed(String(describing: Self.self), owner: self, options: nil),
            let view = loadedViews.first as? UIView {
            addSubview(view)
            view.frame = bounds
        }
        // swiftlint:enable all
    }
    
    func selectLine() {
        lineView.backgroundColor = .black
    }
    
    func selectCircule() {
        circleView.backgroundColor = .black
    }

}

extension UIView {
    func makeCircular() {
        layer.cornerRadius = frame.height / 2
    }
}
