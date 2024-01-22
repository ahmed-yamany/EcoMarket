//
//  OnboardingTests.swift
//  EcoMarketTests
//
//  Created by Ahmed Yamany on 19/01/2024.
//

import XCTest
@testable import EcoMarket

final class OnboardingTests: XCTestCase {
    var onboardingViewController: OnboardingViewController?

    override func setUpWithError() throws {
        onboardingViewController = OnboardingViewController()
        onboardingViewController?.view.layoutIfNeeded()
    }

    override func tearDownWithError() throws {
        onboardingViewController = nil

    }
    
    func test_outlets() throws {
        XCTAssertNotNil(onboardingViewController?.onboardingCollectionView)
        XCTAssertNotNil(onboardingViewController?.nextButton)
        XCTAssertNotNil(onboardingViewController?.pageControlView)
    }

}
