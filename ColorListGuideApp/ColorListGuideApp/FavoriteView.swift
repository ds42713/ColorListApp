//
//  FavoriteView.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 28/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import SwiftUI

struct FavoriteView: View {
    @Binding var colorfavorite:[Datum]
    var body: some View {
        List{
            ForEach(self.colorfavorite, id: \.id) { item in
             HStack{
                 VStack{
                            Text(item.name)
                             Text("ปี \(item.year)")
                            Text(item.color)
                        }
             }
            }
        }.onAppear()
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView(colorfavorite: .constant([]))
    }
}
