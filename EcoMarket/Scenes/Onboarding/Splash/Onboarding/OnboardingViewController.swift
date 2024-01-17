//
//  OnboardingViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var pageControlView: FlexiblePageControl!
    
    let viewModel = OnboardingViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        setupUI()
    }
    
    // MARK: - Setup UI
    private func setupUI() {
        onboardingCollectionView.registerNib(cell: OnboardingCollectionViewCell.self)
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.isScrollEnabled = false
        
        setupPageControl()
    }
    
    private func setupPageControl() {
        pageControlView.currentPageWidth = 30
        pageControlView.numberOfPages = viewModel.onboardingArray.count
        pageControlView.spacing = 8
    }
    
    private func setupNextButton() {
        nextButton.setTitle("", for: .normal)
        nextButton.backgroundColor = .black
        nextButton.layer.cornerRadius = nextButton.frame.width / 2
        nextButton.clipsToBounds = true
        nextButton.setImage(.onboardingNextButtonVector, for: .normal)
        nextButton.imageView?.contentMode = .scaleAspectFit
        nextButton.addAction(.init(handler: {[weak self] _ in self?.nextBtnTap()}), for: .touchUpInside)
    }
    
    
    // MARK: - IBActions
    private func nextBtnTap() {
        if pageControlView.currentPage < viewModel.onboardingArray.count - 1 {
            pageControlView.currentPage += 1
            scrollToPage(page: pageControlView.currentPage)
        } else {
            let viewController = SplashViewController()
            AppRouter.shared.present(viewController)
        }
    }
    
    // MARK: - Private Functions
    private func scrollToPage(page: Int) {
        let indexPath = IndexPath(item: page, section: 0)
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        onboardingCollectionView.isPagingEnabled = true
    }
}
