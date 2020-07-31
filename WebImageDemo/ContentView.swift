//
//  ContentView.swift
//  WebImageDemo
//
//  Created by Derek Chan on 2020/7/31.
//

import SwiftUI

private let url = URL(string: "https://github.com/xiaoyouxinqing/PostDemo/raw/master/PostDemo/Resources/9dc7402fgy1gavd39ba15j20j60nywii.jpg")!

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(
                    destination: SimpleExample(url: url)){
                    Text("Simple Example")
                }
                NavigationLink(
                    destination: WebImageExample()){
                    Text("Web Image Example")
                }
            }
            .navigationTitle("Title")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
