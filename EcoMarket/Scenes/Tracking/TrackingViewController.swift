//
//  TrackingViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 22/02/2024.
//

import UIKit
import Combine

class TrackingViewController: UIViewController {
    
    // MARK: - Properties
    var sections: [any SectionsLayout] = []
    var viewModel: TrackingViewModel
    let tracking: Tracking
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Outlets
    @IBOutlet weak var trackingStackViewHeightConstraints: NSLayoutConstraint!
    
    @IBOutlet weak var trackingContanerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var trackingView: TrackingView!
    @IBOutlet weak var containerStackView: UIStackView!
    @IBOutlet weak var trackingStackView: UIStackView!
    @IBOutlet weak var shippingDate: UILabel!
    @IBOutlet weak var shippingArea: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var deliveryArea: UILabel!
    @IBOutlet weak var deliveryDate: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var shippingID: UILabel!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var scanButton: UIButton!
    
    // MARK: - Initialization
    init (tracking: Tracking, viewModel: TrackingViewModel) {
        self.tracking = tracking
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - View Lifecycle
    //
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.viewDidLoad()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        image.image = UIImage(named: tracking.image)
        shippingID.text = tracking.ID
        titleLabel.text = tracking.title
        subtitleLabel.text = tracking.subtitle
        shippingDate.text = tracking.shippingDate
        shippingArea.text = tracking.shippingArea
        deliveryArea.text = tracking.deliveryArea
        deliveryDate.text = tracking.deliveryDate
        configureUI()
        sections.append(viewModel.tracking)
        configureCollectionView()
        collectionView.reloadData()
        bindViewModel()
    }
    
    // MARK: - Bind ViewModel
    private func bindViewModel() {
        viewModel.$shipping
            .receive(on: DispatchQueue.main)
            .sink { [weak self] _ in
                self?.collectionView.reloadData()
            }
            .store(in: &cancellable)
    }
    
    // MARK: - Setup UI
    private func configureUI() {
        view.backgroundColor = AppColor.backgroundColor
        containerStackView.isLayoutMarginsRelativeArrangement = true
        containerStackView.layoutMargins = .init(top: 0, left: 20, bottom: 0, right: 20)
        configureTrackingStackView()
        configureTrackingView()
        configureScanButtonUI()
        configureLabelsUI()
    }
    
    private func configureScanButtonUI() {
        scanButton.setTitle("", for: .normal)
        scanButton.setImage(AppImage.Icon.scanerIcon, for: .normal)
    }
    
    private func configureTrackingView() {
        trackingView.count = 4
        trackingView.select(at: 1)
    }
    
    private func configureTrackingStackView() {
        trackingStackView.layoutMargins = .init(top: 20, left: 20, bottom: 20, right: 20)
        trackingStackView.isLayoutMarginsRelativeArrangement = true
        
        // Adding a custom view to the container with shadow
        trackingStackView.backgroundColor = AppColor.mainTheme
        trackingStackView.layer.shadowColor = AppColor.primaryButton.cgColor
        trackingStackView.layer.shadowOffset = .zero
        trackingStackView.layer.shadowOpacity = 0.2
        trackingStackView.layer.shadowRadius = 5
        trackingStackView.layer.cornerRadius = 20
    }
    
    private func configureLabelsUI() {
        shippingID.textColor = AppColor.primaryText
        shippingID.font = .h3
        
        titleLabel.textColor = AppColor.socialButton
        titleLabel.font = .medium
        
        subtitleLabel.textColor = AppColor.primaryText
        subtitleLabel.font = .h3
        
        configureShippingUI()
        configureDeliveryUI()
    }
    
    private func configureShippingUI() {
        shippingDate.textColor = AppColor.socialButton
        shippingDate.font = .medium
        
        shippingArea.textColor = AppColor.primaryText
        shippingArea.font = .h3
    }
    
    private func configureDeliveryUI() {
        deliveryDate.textColor = AppColor.socialButton
        deliveryDate.font = .medium
        
        deliveryArea.textColor = AppColor.primaryText
        deliveryArea.font = .h3
    }
    
    // MARK: - UI Configuration
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

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension TrackingViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    // MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateHeaderStackView(with: scrollView.contentOffset.y)
    }
    
    private func animateHeaderStackView(with offsetY: CGFloat) {
        let maxHeight: CGFloat = 200
        print(offsetY)
        
        if offsetY < 108 && offsetY > -30 {
            trackingStackViewHeightConstraints.constant = maxHeight - offsetY
        }
        
        if offsetY < 108 && offsetY > 0 {
            trackingContanerViewHeightConstraint.constant = maxHeight - offsetY
        }
    }
}


class TrackingView: UIStackView {
    
    private var views: [CustomView] = []
    
    var count: Int = 0 {
        didSet {
            addViews(count)
        }
    }
    
    private func addViews(_ count: Int) {
        removeAllSubViews()
        for _ in 0..<count-1 {
            let viewToAdd = CustomView()
            addArrangedSubview(viewToAdd)
            views.append(viewToAdd)
        }
        distribution = .fillEqually
        
        let view = UIView()
        view.backgroundColor = .red
        view.equalSizeConstraints(14)
        view.layoutIfNeeded()
        view.makeCircular()
        
        addSubview(view)
        view.centerYInSuperview()
        view.makeConstraints(trailingAnchor: trailingAnchor)
    }
    
    private func removeAllSubViews() {
        arrangedSubviews.forEach { view in
            self.removeArrangedSubview(view)
        }
    }
    
    func select(at index: Int) {
        for iii in 0...index {
            views[iii].selectLine()
            views[iii].selectCircule()
        }
        
        if index < views.count - 1 {
            views[index+1].selectCircule()
        } else {
            
        }
        
    }
}
