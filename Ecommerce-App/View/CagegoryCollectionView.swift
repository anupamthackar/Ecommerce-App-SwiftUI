//
//  CollectionView.swift
//  Ecommerce-App
//
//  Created by indianrenters on 28/06/25.
//

import SwiftUI

struct CategoryCollectionView: View {
   @EnvironmentObject var cartManager: CartManager
   let colums: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
   
   @Binding var selectedCategory: String
   
   var body: some View {
      
      ScrollView {
         VStack {
            HeaderView()
            
            LazyVGrid(columns: colums, content: {
               ForEach(productList, id: \.id) { item in
                  if selectedCategory.lowercased() == "all" {
                     SmallProductCard(product: item)
                        .environmentObject(cartManager)
                  }
                  else if item.category == selectedCategory.lowercased() {
                     SmallProductCard(product: item)
                        .environmentObject(cartManager)
                  }
               }
            })
         }
      }
      .navigationBarBackButtonHidden()
   }
}

#Preview {
   @Previewable @State var selectedCategory = "Chips"
   CategoryCollectionView(selectedCategory: $selectedCategory)
      .environmentObject(CartManager())
}

struct SmallProductCard: View {
   @EnvironmentObject var cartManager: CartManager
   var product: Product
   
   var body: some View {
      ZStack {
         // Image
         Image(product.image)
            .resizable()
            .scaledToFit()
            .frame(width: 150)
            .rotationEffect(Angle(degrees: 36))
            .padding(.bottom, -70)
            .padding(.trailing, -80)
            
            
         ZStack {
            VStack(alignment: .leading) {
               Text(product.name)
                  .font(.system(size: 18, weight: .semibold))
//                  .frame(width: 70)
               
               Text(product.category)
                  .padding()
                  .font(.system(size: 10))
                  .background(.white.opacity(0.5))
                  .clipShape(Capsule())
               
               Spacer()
               
               HStack {
                  Text("$\(product.price).0")
                     .font(.system(size: 14))
                  Spacer()
                  Button {
                     cartManager.addToCart(product: product)
                  } label: {
                     Image(systemName: "basket")
                        .imageScale(.medium)
                        .frame(width: 55, height: 35)
                        .foregroundStyle(.white)
                        .background(.black)
                        .clipShape(Capsule())
                  }
               }
               .padding(10)
               .frame(height: 50)
               .frame(maxWidth: .infinity)
               .background(
                  VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                     .opacity(0.9)
                     .clipShape(Capsule())
                     .overlay(
                        RoundedRectangle(cornerRadius: 50)
                           .stroke(Color.white.opacity(0.9), lineWidth: 1) // Subtle border
                     )
               )
         }
            .padding(2)
            .frame(width: 142, height: 200)
            
            
         }
      }
      .padding(20)
      
      .background(product.color.opacity(0.13))
      .clipShape(.rect(cornerRadius: 47))
      .padding(.leading,20)
      .padding(.trailing,20)
   }
}


struct HeaderView: View {
   @Environment(\.dismiss) var dismiss
   var selectedCategory: String = "Chips"
   var body: some View {
      HStack {
         Text("**\(selectedCategory)** Collections")
            .font(.system(size: 36))
            .padding(.trailing)
         
         Spacer()
         Button {
            dismiss()
         } label: {
            Image(systemName: "arrow.backward")
               .imageScale(.large)
               .padding()
               .frame(width: 70, height: 90)
               .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
         }
         .foregroundStyle(.black)
      }
      .padding(.horizontal,30)
   }
}
