//
//  ContentView.swift
//  Demo_SwiftUI_ListView
//
//  Created by Siddhath Shah on 19/12/19.
//  Copyright © 2019 Siddhath Shah. All rights reserved.
//

import SwiftUI

struct Weather: Identifiable {
    var id = UUID()
    var image: String
    var temp: Int
    var city: String
}
struct ContentView: View {
    @State var name: String = ""
    @State private var startAnimation: Bool = false
    @State private var currentPosition: CGSize = .zero
    @State private var newPosition: CGSize = .zero
    @State var sliderValue = 0.0
    @State var numberOfItems: Int = 0
    var minimumValue = 0.0
    var maximumvalue = 100.0
    let modelData: [Weather] = [Weather(image: "cloud.rain", temp: 21, city: "Ahmedabad"),
                                Weather(image: "cloud.sun.rain", temp: 18, city: "Vadodara"),
                                Weather(image: "sun.max", temp: 25, city: "Mumbai"),
                                Weather(image: "cloud.sun", temp: 23, city: "Delhi")]
    var body: some View {
        ZStack {
            Color.white
                .edgesIgnoringSafeArea(.all)
            VStack {
                NavigationView() {
                    List(modelData) { weather in
                        NavigationLink(destination: Text(weather.city).font(.largeTitle)) {
                            HStack {
                                Image(systemName: weather.image)
                                    .frame(width: 50, height: 10, alignment: .leading)
                                Text("\(weather.temp)º")
                                    .frame(width: 50, height: 10, alignment: .center)
                                VStack {
                                    Text(weather.city)
                                }
                            }.font(.title)
                        }
                    }
                    .padding()
                    .navigationBarTitle(Text("India Weather"))
                }
            }
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
