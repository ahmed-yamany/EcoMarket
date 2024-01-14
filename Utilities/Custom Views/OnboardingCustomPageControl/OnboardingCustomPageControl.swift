//
//  OnboardingCustomPageControl.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

@IBDesignable
class FlexiblePageControl: UIView {
    // MARK: - Properties
    @IBInspectable var numberOfPages: Int = 1 {
        didSet {
            createPages()
            currentPage = 0
            
        }
    }
    var currentPage: Int = 0 {
        didSet {
            if currentPage < numberOfPages {
                updateCurrentPage()
            } else {
                currentPage = numberOfPages - 1
            }
        }
    }
    //
    @IBInspectable var pageTintColor: UIColor? = .gray
    @IBInspectable var currentPageTintColor: UIColor? = .black
    //
    @IBInspectable var spacing: CGFloat = 4 {
        didSet {
            pagesStackView.spacing = spacing
        }
    }
    //
    @IBInspectable var pageWidth: CGFloat = 8
    @IBInspectable var pageHeight: CGFloat = 8
    @IBInspectable var currentPageWidth: CGFloat = 8
    @IBInspectable var currentPageHeight: CGFloat = 8
    //
    /// Holds the pages
    private var pagesStackView = UIStackView()
    private var widthConstraints: [NSLayoutConstraint] = []
    private var heightConstraints: [NSLayoutConstraint] = []
    // MARK: - Initialization
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    // MARK: - Private Methods
    private func configure() {
        backgroundColor = .clear
        configurePagesStackView()
    }
    private func configurePagesStackView() {
        pagesStackView.axis = .horizontal
        pagesStackView.alignment = .center
        pagesStackView.distribution = .equalSpacing
        pagesStackView.spacing = spacing
        //
        layoutPagesStackView()
    }
    ///
    private func createPages() {
        resetPages()
        //
        for _ in 0..<numberOfPages {
            pagesStackView.addArrangedSubview(createPage())
        }
        //
        activateConstraints()
    }
    ///
    private func createPage() -> UIView {
        let page = UIView()
        //
        let widthCons = page.widthAnchor.constraint(equalToConstant: pageWidth)
        let heightCons = page.heightAnchor.constraint(equalToConstant: pageHeight)
        //
        widthConstraints.append(widthCons)
        heightConstraints.append(heightCons)
        //
        page.layer.cornerRadius = pageHeight / 2
        page.backgroundColor = pageTintColor
        //
        return page
    }
    ///
    private func updateCurrentPage() {
        for (index, page) in pagesStackView.arrangedSubviews.enumerated() {
            let widthConstraint = widthConstraints[index]
            let heightConstraint = heightConstraints[index]
            //
            if index == currentPage {
                updateSelected(page, widthConstraint, heightConstraint)
            } else {
                updateNotSelected(page, widthConstraint, heightConstraint)
            }
            UIView.animate(withDuration: 0.2) {
                self.pagesStackView.layoutIfNeeded()
            }
        }
    }
    ///
    private func layoutPagesStackView() {
        addSubview(pagesStackView)
        pagesStackView.translatesAutoresizingMaskIntoConstraints = false
        pagesStackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        pagesStackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    ///
    private func activateConstraints() {
        widthConstraints.forEach { $0.isActive = true}
        heightConstraints.forEach { $0.isActive = true}
    }
    ///
    private func resetPages() {
        pagesStackView.arrangedSubviews.forEach { [unowned self] view in
            pagesStackView.removeArrangedSubview(view)
        }
    }
    ///
    private func updateSelected(_ page: UIView, _ widthConstraint: NSLayoutConstraint, _ heightConstraint: NSLayoutConstraint) {
        page.backgroundColor = currentPageTintColor
        widthConstraint.constant = currentPageWidth
        heightConstraint.constant = currentPageHeight
    }
    ///
    private func updateNotSelected(_ page: UIView, _ widthConstraint: NSLayoutConstraint,
                                   _ heightConstraint: NSLayoutConstraint) {
        page.backgroundColor = pageTintColor
        widthConstraint.constant = pageWidth
        heightConstraint.constant = pageHeight
    }

}
