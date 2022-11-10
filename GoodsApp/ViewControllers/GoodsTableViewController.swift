//
//  GoodsTableViewController.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 10.11.2022.
//

import UIKit

class GoodsTableViewController: UITableViewController {

    private var goodsList: [Goods] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchGoods()
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        goodsList.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)

        let goods = goodsList[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = goods.title
        content.secondaryText = "Category: \(String(describing: goods.category.name))"
        cell.contentConfiguration = content
        
        return cell
    }

    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detailsVC = segue.destination as? DetailsViewController
        guard let indexPath = tableView.indexPathForSelectedRow else { return }
        detailsVC?.goods = goodsList[indexPath.row]
    }
    
}

// MARK: - Networking
extension GoodsTableViewController {
    private func fetchGoods() {
        NetworkManager.shared.fetch([Goods].self, from: Link.baseURL.rawValue) { [weak self] result in
            switch result {
            case .success(let goods):
                self?.goodsList = goods
                self?.tableView.reloadData()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
