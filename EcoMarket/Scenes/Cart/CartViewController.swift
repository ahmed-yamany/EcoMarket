//
//  CartViewController.swift
//  EcoMarket
//
//  Created by Ibrahim Nasser Ibrahim on 27/01/2024.
//

import UIKit

class CartViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var products: [CartModel] = [
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image"),
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image"),
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image"),
        .init(name: "Vado Odelle Dress", brand: "Roller Rabbit", price: "$198.00", image: "image")
    ]

    @IBOutlet weak var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureCollectionView()
    }
    
    private func configureCollectionView() {

        collectionView.registerNib(PrroductCollectionViewCell.self)
          collectionView.register(Header.self,
                                  forSupplementaryViewOfKind: Header.elementKind,
                                  withReuseIdentifier: Header.identifier)
          collectionView.collectionViewLayout = createCompositionalLayout()
        collectionView.delegate = self
        collectionView.dataSource = self
      }
    
    // MARK: - Compositional Layout
      //
      /// Creates a compositional layout for the collection view.
      /// - Returns: A UICollectionViewCompositionalLayout object.
      private func createCompositionalLayout() -> UICollectionViewCompositionalLayout {

          let interItemSpacing: CGFloat = 15.0
          let padding: CGFloat = 25.0
          let height: CGFloat = 150

          // Item
          let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))
          let item = NSCollectionLayoutItem(layoutSize: itemSize)

          // Group
          let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(height))
          let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
          group.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: padding, trailing: padding)
          group.interItemSpacing = .fixed(interItemSpacing)

          // Header
          let header = createHeader()

          // Section
          let section = NSCollectionLayoutSection(group: group)
          section.boundarySupplementaryItems = [header]

          return UICollectionViewCompositionalLayout(section: section)
      }

      private func createHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
          let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(50))
          let header = NSCollectionLayoutBoundarySupplementaryItem(
              layoutSize: headerSize,
              elementKind: Header.elementKind,
              alignment: .top
          )

          header.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 0)
          return header
      }

      // MARK: - UICollectionViewDataSource

       func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
          return products.count
      }

       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          guard let cell: PrroductCollectionViewCell = collectionView.dequeue(indexPath: indexPath) else {
              Logger.log("Can't dequeue ProductsCollectionViewCell", category: \.default, level: .fault)
              return UICollectionViewCell()
          }
          cell.setup(product: products[indexPath.row])
          return cell
      }

       func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String,
                                   at indexPath: IndexPath) -> UICollectionReusableView {
          guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                             withReuseIdentifier: Header.identifier,
                                                                             for: indexPath) as? Header else {
              Logger.log("Failed to get header view", category: \.default, level: .fault)
              return UICollectionReusableView()
          }
          header.setTitle("Cart")
          return header
      }
  }

extension UICollectionReusableView: Identifiable {}

class Header: UICollectionReusableView {
    static let elementKind = String("Cart")

    let label = UILabel()

    // MARK: - Initialization
    //
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLabel()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLabel() {
        label.font = .h2
        addSubview(label)
    }

    public func setTitle(_ title: String) {
        label.text = title
    }
}
