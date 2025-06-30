//
//  Home.swift
//  Ecommerce-App
//
//  Created by indianrenters on 27/06/25.
//

import SwiftUI

struct Home: View {
   @EnvironmentObject var cartManager: CartManager
   // Category View Properties
   @State var selectedCategory = "Chips"
   
    var body: some View {
       NavigationStack {
          ScrollView {
             HeadingView()
             
             // Categoty List
             CategoryListView
                .environmentObject(cartManager)
             
             // Collection View
             CollectionView(categoryItem: $selectedCategory)
                .environmentObject(cartManager)
             
             // Product List
             ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                   ForEach(productList, id: \.id) { item in
                      // Product Card
                      ProductCard(product: item)
                         .environmentObject(cartManager)
                   }
                }
             }
          }
       }
    }
   
   
   var CategoryListView: some View {
      HStack {
         ScrollView(.horizontal, showsIndicators: false) {
            HStack {
               ForEach(categoryList, id: \.id) { item in
                  Button {
                     selectedCategory = item.title
                  } label: {
                     HStack {
                        if item.title != "All"{
                           Image(item.icon)
                              .renderingMode(.template)
                              .foregroundStyle(selectedCategory == item.title ? .yellow : .black)
                        }
                        
                        Text(item.title)
                           .foregroundStyle(selectedCategory == item.title ? .white : .black)
                     }
                     .padding(20)
                     .background(selectedCategory == item.title ? .black : .gray.opacity(0.1))
                     .clipShape(Capsule())
                  }
               }
            }
            .padding(.horizontal, 30)
            .padding(.vertical, 15)
         }
      }
   }
   
   
}

#Preview {
    Home()
      .environmentObject(CartManager())
}


struct CollectionView: View {
   @EnvironmentObject var cartManager: CartManager
   @Binding var categoryItem: String
   var body: some View {
      HStack {
         
            Text("\(categoryItem) **Collection**")
               .font(.system(size: 24))
         
         
         Spacer()
         
         NavigationLink(destination: {
            CategoryCollectionView(selectedCategory: $categoryItem)
               .environmentObject(cartManager)
         }, label: {
            Image(systemName: "arrow.right")
               .imageScale(.large)
         })
         .foregroundStyle(.black)
      }
      .padding(.horizontal, 30)
      .padding(.vertical, 15)
   }
}


struct HeadingView: View {
   var body: some View {
      VStack {
         HStack {
             Text("Order From The Best Of **Snacks**")
               .font(.system(size: 30))
               .padding(.trailing)
            
            Spacer()
            
            Image(systemName: "line.3.horizontal")
               .imageScale(.large)
//               .padding()
               .frame(width: 70, height: 90)
               .overlay(RoundedRectangle(cornerRadius: 50).stroke().opacity(0.4))
               
          }
         .padding(.horizontal,30)
      }
      
   }
}


struct ProductCard: View {
   @EnvironmentObject var cartManager: CartManager
   var product: Product
   
   var body: some View {
      ZStack {
         Image(product.image)
            .resizable()
            .scaledToFit()
            .padding(.trailing, -200)
            .rotationEffect(Angle(degrees: 36))
         
         ZStack {
            VStack(alignment: .leading, content: {
               Text(product.name)
                  .font(.system(size: 36, weight: .semibold))
                  .frame(width: 140)
               
               Text(product.category)
                  .font(.callout)
                  .foregroundStyle(.black.opacity(0.5))
                  .padding()
                  .background(.white.opacity(0.7))
                  .clipShape(Capsule())
               Spacer()
               
               HStack {
                  Text("$\(product.price).0")
                     .font(.system(size: 24, weight: .bold))
                  Spacer()
                  
                  Button(action: {
                     cartManager.addToCart(product: product)
                  }, label: {
                     Image(systemName: "basket")
                        .imageScale(.large)
   //                     .padding()
                        .frame(width: 90, height: 68)
                        .background(.black)
                        .clipShape(Capsule())
                        .foregroundStyle(.white)

                  })
                  .padding(.horizontal, -10)
               }
               .padding(.leading)
               .padding()
               .frame(maxWidth: .infinity)
               .frame(height: 80)
               .background(
                  VisualEffectView(effect: UIBlurEffect(style: .systemMaterial))
                     .opacity(0.9)
                     .clipShape(Capsule())
                     .overlay(
                        RoundedRectangle(cornerRadius: 50)
                           .stroke(Color.white.opacity(0.9), lineWidth: 1)
                     )
               )
            })
         }
         .padding(30)
         .frame(width: 336, height: 422)
      }
      
      .background(product.color.opacity(0.13))
      .clipShape(.rect(cornerRadius: 57))
      .padding(.leading, 20)
   }
}






















