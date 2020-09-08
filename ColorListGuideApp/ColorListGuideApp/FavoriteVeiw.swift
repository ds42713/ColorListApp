//
//  FavoriteVeiw.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 27/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import SwiftUI

struct FavoriteVeiw: View {
    @State var colorfavorite2:[Datum] = []
    var body: some View {
        List{
            ForEach(self.colorfavorite2, id: \.id) { item in
                HStack{
                    VStack{
                        Text(item.name)
                        Text("ปี \(item.year)")
                        Text(item.color)
                    }
                }.padding()
            }.onDelete(perform: deleteData)
        }
    }
    func deleteData(at offsets : IndexSet)  { // offsets รับค่าตำแหน่งทั้งหมดมา
        offsets.forEach { Index in // Index เป็นแต่ละคัวที่อยู่ใน offset
            colorfavorite2.remove(at: Index)  // ลบตำแหน่งที่ index
        }
    }
}

struct FavoriteVeiw_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteVeiw()
    }
}
