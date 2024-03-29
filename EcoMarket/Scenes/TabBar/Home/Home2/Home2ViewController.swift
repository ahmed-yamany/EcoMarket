//
//  Home2ViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/02/2024.
//

import UIKit

class Home2ViewController: UIViewController {
    
    // MARK: - Properties
    //
    var sections: [any SectionsLayout] = []
    private var headerViewHeight: CGFloat = 0
    
    // MARK: - Outlets
    //
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!    
    @IBOutlet weak var headerStackViewHeightConstraints: NSLayoutConstraint!
    
    let viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods
    //
    override func viewDidLoad() {
        super.viewDidLoad()
        headerViewHeight = headerStackViewHeightConstraints.constant
        sections = viewModel.getSections()
       
        configureCollectionView()
        collectionView.reloadData()
        configureUI()
        
    }
    
    // MARK: - Private Methods
    //
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        setupButtonsUI()
        setupLabelsUI()
    }
    
    /// Configure buttons UI
    private func setupButtonsUI() {
        filterButton.setTitle("", for: .normal)
        filterButton.setImage(AppImage.HomeTheme2.filterButtonIcon, for: .normal)
    }
    
    /// Congiure Labels UI
    private func setupLabelsUI() {
        titleLabel.text = L10n.Home.Theme2.title
        titleLabel.font = .h1
        titleLabel.textColor = AppColor.primaryText
        
        subtitleLabel.text = L10n.Home.Theme2.subtitle
        subtitleLabel.font = .h3
        subtitleLabel.textColor = AppColor.socialButton
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }
}

extension Home2ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: - UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        sections[indexPath.section].collectionView(collectionView, didSelectItemAt: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateHeaderStackView(with: scrollView.contentOffset.y)
    }
    
    private func animateHeaderStackView(with offsetY: CGFloat) {
        let maxHeight: CGFloat = 80
        let maxFontSize: CGFloat = 24
        let midOffsetY: CGFloat = offsetY * 0.5
        
        if offsetY <= 0.0 {
            headerStackViewHeightConstraints.constant = maxHeight
            if offsetY > -maxFontSize {
                titleLabel.font = .custom(size: maxFontSize - midOffsetY, weight: .bold)
            }
            
        } else {
            if offsetY * 2 <= maxFontSize {
                titleLabel.font = .custom(size: maxFontSize - midOffsetY, weight: .bold)
            }
            headerStackViewHeightConstraints.constant = maxHeight - offsetY
        }
        self.view.layoutIfNeeded()
    }
}
