//
//  OnboardingViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit
extension LoggingCategories {
    var onboarding: String { "Onboarding" }
}

class OnboardingViewController: UIViewController {
    // MARK: - IBoutlets
    //
    @IBOutlet weak private(set) var onboardingCollectionView: UICollectionView!
    @IBOutlet weak private(set) var nextButton: UIButton!
    @IBOutlet weak private(set) var pageControlView: FlexiblePageControl!
    
    let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        setupUI()
    }
    
    // MARK: - Setup UI
    //
    private func setupUI() {
        view.backgroundColor = AppColor.backgroundColor
        
        setupCollectionView()
        setupPageControl()
        setupNextButton()
    }
    
    private func setupCollectionView() {
        onboardingCollectionView.registerNib(OnboardingCollectionViewCell.self)
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.isScrollEnabled = false
    }
    
    private func setupPageControl() {
        pageControlView.currentPageWidth = 30
        pageControlView.numberOfPages = viewModel.onboardingArray.count
        pageControlView.spacing = 8
    }
    
    private func setupNextButton() {
        nextButton.setTitle("", for: .normal)
        nextButton.backgroundColor = AppColor.primaryButton
        nextButton.layer.cornerRadius = nextButton.frame.width / 2
        nextButton.clipsToBounds = true
        nextButton.setImage(AppImage.Onboarding.nextButton, for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        nextButton.addAction(.init(handler: {[weak self] _ in self?.nextButtonTap()}), for: .touchUpInside)
    }
    
    // MARK: - IBActions
    //
    private func nextButtonTap() {
        viewModel.move(didMoved: {currentIndex in
            pageControlView.currentPage = currentIndex
            scroll(to: currentIndex)
        }, reachedEnd: {
            let viewController = SplashViewController()
            AppRouter.shared.present(viewController)
        })
    }
    
    // MARK: - Private Functions
    private func scroll(to page: Int) {
        let indexPath = IndexPath(item: page, section: 0)
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        onboardingCollectionView.isPagingEnabled = true
    }
}

// MARK: - CollectionView Layout
//
extension OnboardingViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.onboardingArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell: OnboardingCollectionViewCell = onboardingCollectionView.dequeue(indexPath: indexPath) else {
            Logger.log("failed to cast cell", category: \.onboarding, level: .fault)
            return UICollectionViewCell()
        }
        
        cell.setup(viewModel.onboardingArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        // let cell's size equal collection view
        return CGSize(width: onboardingCollectionView.frame.width, height: onboardingCollectionView.frame.height)
    }
}
