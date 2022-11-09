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

extension GoodsViewController {
    private func fetchGoods() {
        guard let url = URL(string: Link.baseURL.rawValue) else { return }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description")
                return
            }
            
            let decoder = JSONDecoder()
            
            do {
                let person = try decoder.decode(Goods.self, from: data)
                print(person)
            } catch let error {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

