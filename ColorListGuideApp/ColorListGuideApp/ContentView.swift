//
//  ContentView.swift
//  ColorListGuideApp
//
//  Created by Pongsakorn Praditkanok on 26/8/2563 BE.
//  Copyright © 2563 Ds42713. All rights reserved.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    @State var index = 0
    @State var showSheet = false
    @State var showSheetfavorite = false
    @State var colorData:[Datum] = []
    @State var colorfavoriteData:[Datum] = []
    var body: some View {
        ZStack{
            VStack{
                if self.index == 0 {
                    HStack {
                                       Text("Color List").padding()
                                       Spacer()
                                       Button(action: {
                                           self.showSheet = true
                                       } ) {
                                           Text("เรียงลำดับ").padding()
                                       }.padding()
                                   }.actionSheet(isPresented: $showSheet) {
                                       ActionSheet( title: Text("เรียงลำดับ"),
                                                    buttons: [
                                                       .default(Text("มากไปน้อย")) { self.hightolowData() },
                                                       .default(Text("น้อยไปมาก")) { self.lowtohighData() },
                                                       .cancel()
                                       ])
                                   }
                    List{
                        ForEach(self.colorData, id: \.id) { item in
                            HStack{
                                VStack {
                                    Text(item.name)
                                    Text("ปี \(item.year)")
                                    Text(item.color)
                                }
                                Spacer()
                                Button(action: {
                                  
                                        self.colorfavoriteData.append(item)
                                    
                                })
                                {
                                    Image(systemName: "suit.heart")
                                }
                            }.padding()
                        }
                    }.onAppear { self.feeddata() }
                }else if self.index == 1 {
                    HStack {
                                       Text("Color List").padding()
                                       Spacer()
                                       Button(action: {
                                           self.showSheetfavorite = true
                                       } ) {
                                           Text("เรียงลำดับ").padding()
                                       }.padding()
                                   }.actionSheet(isPresented: $showSheetfavorite) {
                                       ActionSheet( title: Text("เรียงลำดับ"),
                                                    buttons: [
                                                       .default(Text("มากไปน้อย")) { self.hightolowfavorite() },
                                                       .default(Text("น้อยไปมาก")) { self.lowtohighfavorite() },
                                                       .cancel()
                                       ])
                                   }
                    List {
                        ForEach(self.colorfavoriteData, id: \.id) { item in
                            HStack{
                                VStack{
                                    Text(item.name)
                                    Text("ปี \(item.year)")
                                    Text(item.color)
                                }
                            }
                        }.onDelete(perform: deleteData)
                    }
                }
                HStack {
                    Button(action: {
                        self.index = 0
                    }
                    ) {
                        Image(systemName: "house.fill")
                            .foregroundColor(index == 0 ? .white : Color.black.opacity(0.35))
                            .padding(10)
                            .background(index == 0 ? Color.black : Color.clear)
                            .cornerRadius(8)
                        
                        Text(index == 0 ? "home" : "")
                            .foregroundColor(.black)
                    }
                    Button(action: {
                        self.index = 1
                    }
                    ) {
                        Image(systemName: "suit.heart")
                            .foregroundColor(index == 1 ? .white : Color.black.opacity(0.35))
                            .padding(10)
                            .background(index == 1 ? Color.black : Color.clear)
                            .cornerRadius(8)
                        Text(index == 1 ? "favorite" : "")
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

    func hightolowData() {
        self.colorData = colorData.sorted(by: {$0.year > $1.year})
    }
    func lowtohighData() {
        self.colorData = colorData.sorted(by: {$0.year < $1.year})
    }
    
    func hightolowfavorite() {
           self.colorfavoriteData = colorfavoriteData.sorted(by: {$0.year > $1.year})
       }
    func lowtohighfavorite() {
        self.colorfavoriteData = colorfavoriteData.sorted(by: {$0.year < $1.year})
    }
    
    func deleteData(at offsets : IndexSet)  {
        offsets.forEach { Index in
            colorfavoriteData.remove(at: Index)
        }
    }
    func feeddata()  {
        let url = "https://reqres.in/api/unknows"
        AF.request(url, method: .get).responseJSON { (response) in
            switch response.result {
            case .success: print(response.value)
            do {
                let result = try JSONDecoder().decode(APIColor.self, from: response.data!)
                self.colorData.removeAll()
                self.colorData = result.data
            } catch{
                print(error.localizedDescription)
                }
            case .failure(let err) : print(err.responseCode)
                
            }
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
