//
//  Goods.swift
//  GoodsApp
//
//  Created by Nikita Chekan on 09.11.2022.
//

struct Goods: Decodable {
    let title: String?
    let price: Int?
    let description: String?
    let category: Category?
}

struct Category: Decodable {
    let name: String?
    let image: String?
}

