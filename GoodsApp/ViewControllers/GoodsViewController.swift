//
//  ViewController.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

import UIKit

class GoodsViewController: UIViewController {

    
    @IBOutlet var goodsImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoods()
    }
    
    private func configure(with goods: Goods) {
        navigationItem.title = goods.category?.name
        titleLabel.text = goods.title
        descriptionLabel.text = goods.description
        priceLabel.text = "$\(goods.price ?? 0)"
        
        NetworkManager.shared.fetchImage(from: goods.category?.image) { [weak self] result in
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
extension GoodsViewController {
    private func fetchGoods() {
        NetworkManager.shared.fetch(Goods.self, from: Link.baseURL.rawValue) { result in
            switch result {
            case .success(let info):
                print(info)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

