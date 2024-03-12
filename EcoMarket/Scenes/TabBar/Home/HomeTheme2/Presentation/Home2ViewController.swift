//
//  Home2ViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 15/02/2024.
//

import UIKit
import Combine

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
    
    var sectionsCancellable: Cancellable?
    
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
        bindViewModel()
        configureUI()
        
        viewModel.reloadData = {[weak self] in
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewWillAppear()
    }
    
    // MARK: - Private Methods
    //
    
    private func bindViewModel() {
        sectionsCancellable = viewModel.$sections
            .sink {[weak self] sections in
                guard let self = self else {
                    return
                }
                DispatchQueue.main.async {
                    self.sections = sections
                    self.configureCollectionView()
                    self.collectionView.reloadData()
                }
            }
    }
    
    // MARK: - UI Configuration
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.layoutMargins = UIEdgeInsets(top: 0, left: 25, bottom: 0, right: 25)
        containerStackView.isLayoutMarginsRelativeArrangement = true
        setupButtonsUI()
        setupLabelsUI()
    }
    
    private func setupButtonsUI() {
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
            headerStackViewHeightConstraints.constant = maxHeight - offsetY * 2
        }
        self.view.layoutIfNeeded()
    }
}
