//
//  OnboardingViewController.swift
//  EcoMarket
//
//  Created by Youssef Eldeeb on 13/01/2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var onboardingCollectionView: UICollectionView!
    @IBOutlet weak var nextBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let viewModel = OnboardingViewModel()
    
    var currentPage: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()  
        
        onboardingCollectionView.delegate = self
        onboardingCollectionView.dataSource = self
        
        initUI()
    }
    
    private func initUI(){
        onboardingCollectionView.registerNib(cell: OnboardingCollectionViewCell.self)
        onboardingCollectionView.isPagingEnabled = true
        onboardingCollectionView.showsHorizontalScrollIndicator = false
        onboardingCollectionView.isScrollEnabled = false
        
        pageControl.numberOfPages = viewModel.onboardingArray.count
        nextBtn.setTitle("", for: .normal)
        nextBtn.backgroundColor = .black
        nextBtn.layer.cornerRadius = nextBtn.frame.width / 2
        nextBtn.clipsToBounds = true
        nextBtn.setImage(.onboardingNextButtonVector, for: .normal)
        nextBtn.imageView?.contentMode = .scaleAspectFit
        nextBtn.addTarget(self, action: #selector(nextBtnTap), for: .touchUpInside)
    }
    @objc private func nextBtnTap(){
        if currentPage < viewModel.onboardingArray.count - 1{
            currentPage += 1
            scrollToPage(page: currentPage)
            pageControl.currentPage = currentPage
        }else{
            // go to register page
        }
    }
    
    private func scrollToPage(page: Int){
        let indexPath = IndexPath(item: page, section: 0)
        onboardingCollectionView.isPagingEnabled = false
        onboardingCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
        onboardingCollectionView.isPagingEnabled = true
    }
    
}