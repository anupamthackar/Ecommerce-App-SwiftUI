//
//  ProductModel.swift
//  Ecommerce-App
//
//  Created by indianrenters on 27/06/25.
//

import Foundation
import SwiftUI

struct Product: Identifiable {
   var id: UUID = .init()
   var name: String
   var category: String
   var image: String
   var color: Color
   var price: Int
}

let productList: [Product] = [
   Product(name: "Coconut Chips", category: "chips", image: "coconutChips", color: .green, price: 34),
   Product(name: "Dark Russet", category: "chips", image: "darkrusset", color: .brown, price: 58),
   Product(name: "Deep River", category: "chips", image: "deepRiver", color: .purple, price: 77),
   Product(name: "Good Source", category: "choco", image: "goodSource", color: .pink, price: 12),
   Product(name: "Perfect Snacks", category: "choco", image: "perfectSnacks", color: .purple, price: 45),
   Product(name: "Ragular Natures", category: "snacks", image: "ragularNatures", color: .blue, price: 20),
   Product(name: "Smiths Chips", category: "toffee", image: "smithsChips", color: .orange, price: 12),
   Product(name: "Twister Chips", category: "chips", image: "twisterChips", color: .red, price: 10),
   Product(name: "Unreal Muffin", category: "choco", image: "unrealMuffin", color: .green, price: 88)
]
