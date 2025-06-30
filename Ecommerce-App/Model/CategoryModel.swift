//
//  CategoryModel.swift
//  Ecommerce-App
//
//  Created by indianrenters on 27/06/25.
//

import Foundation


struct CategoryModel: Identifiable, Hashable {
   let id: UUID = .init()
   let icon: String
   let title: String
}


var categoryList: [CategoryModel] = [
   CategoryModel(icon: "", title: "All"),
   CategoryModel(icon: "choco", title: "Choco"),
   CategoryModel(icon: "chips", title: "Chips"),
   CategoryModel(icon: "toffee", title: "Toffee")
]
