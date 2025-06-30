//
//  ContentView.swift
//  Ecommerce-App
//
//  Created by indianrenters on 27/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
   @StateObject var cartManager = CartManager()
   
   var body: some View {
      NavigationStack {
         VStack(alignment: .leading){
            Home()
               .environmentObject(cartManager)
            
            if cartManager.products.count > 0 {
               NavigationLink(destination: CartView().environmentObject(cartManager), label: {
                  HStack(spacing: 20){
                     Text("\(cartManager.products.count)")
                        .padding()
                        .background(.yellow)
                        .clipShape(Circle())
                        .foregroundStyle(.black)
                     
                     VStack(alignment: .leading) {
                        Text("Cart")
                           .font(.system(size: 26, weight: .semibold))
                        Text("\(cartManager.products.count) Items")
                           .font(.system(size: 18))
                     }
                     Spacer()
                     
                     ForEach(cartManager.products.prefix(4), id: \.name) { product in
                        Image(product.image)
                           .resizable()
                           .scaledToFit()
                           .padding(8)
                           .frame(width: 60, height: 60)
                           .background(.white)
                           .clipShape(Circle())
                           .padding(.leading, -55)
                     }
                     if cartManager.products.count > 4 {
                        Image(systemName: "cart.badge.plus.fill")
                           .resizable()
                           .scaledToFit()
                           .padding(8)
                           .frame(width: 60, height: 60)
                           .background(.white)
                           .clipShape(Circle())
                           .padding(.leading, -60)
                           .foregroundStyle(.yellow)
                     }
                  }
                  .padding(30)
                  .frame(width: .infinity, height: 120)
                  .background(.black)
                  .clipShape(.rect(topLeadingRadius: 60, topTrailingRadius: 60))
                  .foregroundStyle(.white)
               })
            }
         }
         .ignoresSafeArea(edges: .bottom)
      }
   }
}

#Preview {
   ContentView()
      .environmentObject(CartManager())
}
