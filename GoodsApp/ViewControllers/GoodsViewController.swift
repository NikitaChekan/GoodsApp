//
//  ViewController.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

import UIKit

class GoodsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoods()
    }

}

// MARK: - Networking
extension GoodsViewController {
    private func fetchGoods() {
        NetworkManager.shared.fetch(Goods.self, from: Link.baseURL.rawValue) { result in
            switch result {
            case .success(let course):
                print(course)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

