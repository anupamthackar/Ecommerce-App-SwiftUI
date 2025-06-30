//
//  CartView.swift
//  Ecommerce-App
//
//  Created by indianrenters on 30/06/25.
//

import SwiftUI

struct CartView: View {
   @EnvironmentObject var cartManager: CartManager
   
    var body: some View {
       ScrollView {
          CartHeader()
             .environmentObject(cartManager)
          
          //Product Cart
          ForEach(cartManager.products) { item in
             CartProductList(product: item)
                .environmentObject(cartManager)
          }
          .padding(.horizontal, 20)
          
          // Total Amount
          VStack(alignment: .leading) {
             HStack {
                Text("Delivery Amount")
                Spacer()
                Text("Free")
                   .font(.system(size: 24, weight: .semibold))
             }
             
             Divider()
             Text("Total Amount")
                .font(.system(size: 24))
             Text("USD \(cartManager.total)")
                .font(.system(size: 36, weight: .semibold))
          }
          .padding(30)
          .frame(maxWidth: .infinity)
          .background(.yellow.opacity(0.5))
          .clipShape(.rect(cornerRadius: 30))
          .padding()
          
          // Button to make payment
          Button {
             
          } label: {
             Text("Make Payment")
                .font(.system(size: 24, weight: .semibold))
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .background(.yellow.opacity(0.5))
                .clipShape(Capsule())
                .foregroundStyle(.black)
                .padding()
          }
          
       }
       
       
    }
}


struct CartProductList: View {
   @EnvironmentObject var cartManager: CartManager
   var product: Product
   var body: some View {
      HStack(alignment: .center, spacing: 20) {
         Image(product.image)
            .resizable()
            .scaledToFit()
            .padding()
            .frame(width: 80, height: 80)
            .background(.gray.opacity(0.1))
            .clipShape(Circle())

         
         VStack(alignment: .leading) {
            Text(product.name)
               .font(.headline)
            
            Text(product.category)
               .font(.callout)
               .opacity(0.5)
         }
         
         Spacer()
         
         Text("$\(product.price)")
            .font(.headline)
            .padding()
            .background(.yellow.opacity(0.5))
            .clipShape(Circle())
      }
   }
}

struct CartHeader: View {
   @EnvironmentObject var cartManager: CartManager
   @Environment(\.dismiss) var dismiss
   var body: some View {
      HStack {
          Text("Cart")
            .font(.system(size: 30, weight: .semibold))
            .padding(.trailing)
         
         Spacer()
         Button {
            dismiss()
         } label: {
            Text("\(cartManager.products.count)")
               .frame(width: 70, height: 90)
               .background(Color.yellow.opacity(0.5))
               .clipShape(Capsule())
         }
         .foregroundStyle(.black)
         
         
         Button {
            dismiss()
         } label: {
            Image(systemName: "arrow.backward")
               .frame(width: 70, height: 90)
               .overlay(content: {
                  RoundedRectangle(cornerRadius: 50).stroke().opacity(0.5)
               })
         }
         .foregroundStyle(.black)
       }
      .padding(.horizontal,30)

   }
}

#Preview {
    CartView()
      .environmentObject(CartManager())
}
