//
//  NotificationCollectionViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 14/02/2024.
//

import UIKit
import Combine

class NotificationCollectionViewController: UICollectionViewController {
    // MARK: - Properties
    //
    var sections: [any SectionsLayout] = []
    var viewModel: NotificationViewModel
    private var cancellable: Set<AnyCancellable> = []
    
    // MARK: - Initializers
    //
    init(viewModel: NotificationViewModel) {
        self.viewModel = viewModel
        super.init(collectionViewLayout: .init())
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
        let notificationSection = NotificationsSection()
        notificationSection.items = NotificationModel.mockData
        
        sections = [notificationSection]
        configureCollectionView()
//        subscribedCategories()
        collectionView.reloadData()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        cancellable.forEach { $0.cancel() }
    }
    
    // MARK: - UI Configuration
    
    /// Configures the collection view with necessary settings and registers cell classes.
    private func configureCollectionView() {
        sections.forEach { section in
            section.registerCell(in: self.collectionView)
            section.registerSupplementaryView(in: self.collectionView)
        }
        collectionView.backgroundColor = AppColor.backgroundColor
        collectionView.collectionViewLayout = createCompositionalLayout()
    }
    
    /// Sets up Combine subscriptions to update the table view when the `viewModel.categories` change.
//    private func subscribedCategories() {
//        viewModel.$notifications
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] notifications in
//                let notificationSection = NotificationsSection()
//                notificationSection.items = notifications
//                self?.sections.append(notificationSection)
//                self?.collectionView.reloadData()
//            }
//            .store(in: &cancellable)
//    }
    
    // MARK: - Compositional Layout
    //
    /// Creates a compositional layout for the collection view.
    /// - Returns: A UICollectionViewCompositionalLayout object.
    private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, layoutEnvironment) in
            self.sections[sectionIndex].sectionLayout(self.collectionView, layoutEnvironment: layoutEnvironment)
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].numberOfItems()
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        sections[indexPath.section].collectionView(collectionView, cellForItemAt: indexPath)
    }
    
    override func collectionView(_ collectionView: UICollectionView, 
                                 viewForSupplementaryElementOfKind kind: String,
                                 at indexPath: IndexPath) -> UICollectionReusableView {
        sections[indexPath.section].collectionView(collectionView, viewForSupplementaryElementOfKind: kind, at: indexPath)
    }
}
