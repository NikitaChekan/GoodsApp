//
//  ViewController.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {

    
    @IBOutlet var goodsImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    var goods: Goods!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoods()
        configure()
    }
    
    // MARK: - Private Methods
    private func configure() {
        navigationItem.title = "\(goods.category.name)"
        titleLabel.text = goods.title
        descriptionLabel.text = goods.description
        priceLabel.text = "$\(goods.price)"

        NetworkManager.shared.fetchData(from: goods.category.image) { [weak self] result in
            switch result {
            case .success(let imageData):
                self?.goodsImage.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Networking
extension DetailsViewController {
    private func fetchGoods() {
        NetworkManager.shared.fetchGoods(from: Link.baseURL.rawValue) { result in
            switch result {
            case .success(let info):
                print(info)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

