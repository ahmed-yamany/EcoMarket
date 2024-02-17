//
//  Home2ViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/02/2024.
//

import UIKit

class Home2ViewController: UIViewController {
    
    var sections: [any SectionsLayout] = []
    let homeFactory = HomeFactory()
    
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var filterButton: UIButton!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var userButton: UIButton!
    @IBOutlet weak var menuButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sections = HomeFactoryModel.mockData
        sections.forEach { section in
            let sectionLayout = homeFactory.createSection(section: section)
            self.sections.append(sectionLayout)
        }
        configureCollectionView()
        collectionView.reloadData()
        configureUI()
        
    }
    
    private func configureUI() {
        containerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        setupButtonsUI()
        setupLabelsUI()
    }
    
    private func setupButtonsUI() {
        menuButton.setTitle("", for: .normal)
        menuButton.setImage(AppImage.HomeTheme2.menuButtonIcon, for: .normal)
        
        userButton.setTitle("", for: .normal)
        userButton.setImage(AppImage.HomeTheme2.userButtonIcon, for: .normal)
        
        filterButton.setTitle("", for: .normal)
        filterButton.setImage(AppImage.HomeTheme2.filterButtonIcon, for: .normal)
    }
    
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
}
