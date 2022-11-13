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
    
    init(courseData: [String: Any]) {
        title = courseData["title"] as? String ?? ""
        price = courseData["price"] as? Int ?? 0
        description = courseData["description"] as? String ?? ""
        category = courseData["category"] as? Category ?? ""
    }
    
    static func getGoods(from value: Any) -> [Goods] {
        guard let coursesData = value as? [[String: Any]] else { return [] }
        return coursesData.map { Goods(courseData: $0) }
    }
}

struct Category: Decodable {
    let name: String
    let image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
}
