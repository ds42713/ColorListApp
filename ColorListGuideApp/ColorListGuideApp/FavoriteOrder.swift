//
//  FavoriteOrder.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 28/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import Foundation

struct FavoriteOrder : Identifiable{
    var id = UUID() // คำสั่ง ID Identifiable
   
    let name: String
    let year: Int
    let color, pantoneValue: String

}

extension FavoriteOrder{
    static func allFavoriteOrder() -> [FavoriteOrder] {
           return [
            FavoriteOrder(,name: "1234444", year: 1 , color : "12313" )
               
           ]
       }
}
