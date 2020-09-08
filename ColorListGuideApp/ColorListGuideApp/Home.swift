//
//  Home.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 28/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import SwiftUI
import Alamofire
struct Home: View {
    @State var colorData:[Datum] = []
    var body: some View {
        List{
            ForEach(self.colorData, id: \.id) { item in
                HStack{
                    VStack{
                       
                        Text(item.name)
                        Text("ปี \(item.year)")
                        Text(item.color)
                    }.onAppear()
                    Spacer()
                    Button(action: {
                        
                    }
                    ) {
                        Image(systemName: "suit.heart")
                    }
                }.padding()
            }
        }.onAppear { self.feeddata() }
    }
    func feeddata()  {
        let url = "https://reqres.in/api/unknows"
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success: print(response.value as Any)
            do {
                let result = try JSONDecoder().decode(APIColor.self, from: response.data!)
                self.colorData.removeAll()
                self.colorData = result.data
            } catch{
                print(error.localizedDescription)
                }
            case .failure(let err) : print(err.responseCode as Any)
                
            }
        }
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
