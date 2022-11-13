//
//  Goods.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

struct Goods: Decodable {
    let title: String
    let price: Int
    let description: String
    let category: Category
    
    init(title: String, price: Int, description: String, category: Category) {
        self.title = title
        self.price = price
        self.description = description
        self.category = category
    }
    
    init(goodsData: [String: Any]) {
        title = goodsData["title"] as? String ?? ""
        price = goodsData["price"] as? Int ?? 0
        description = goodsData["description"] as? String ?? ""
        
        let categoryData = goodsData["category"] as? [String: Any] ?? [:]
        category = Category(categoryData: categoryData)
    }
    
    static func getGoods(from value: Any) -> [Goods] {
        guard let goodsData = value as? [[String: Any]] else { return [] }
        return goodsData.map { Goods(goodsData: $0) }
    }
}

struct Category: Decodable {
    let name: String
    let image: String
    
    init(categoryData: [String: Any]) {
        name = categoryData["name"] as? String ?? ""
        image = categoryData["image"] as? String ?? ""
    }
}
