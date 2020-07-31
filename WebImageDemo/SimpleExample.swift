//
//  SimpleExample.swift
//  WebImageDemo
//
//  Created by Derek Chan on 2020/7/31.
//

import SwiftUI

struct SimpleExample: View {
    let url: URL?
    
    @State private var data: Data?
    
    private var image: UIImage? {
        if let data = data { return UIImage(data: data)}
        return nil
    }
    
    var body: some View {
        let image = self.image
        Group{
            if image != nil {
                Image(uiImage: image!)
                    .resizable()
                    .scaledToFill()
            } else {
                Color.gray
            }
        }
        .frame(height: 600)
        .clipped()
        .onAppear {
            if let url = self.url, self.data == nil {
                DispatchQueue.global().async {//子线程
                    let data = try? Data(contentsOf: url)
                    DispatchQueue.main.async {//主线程
                        self.data = data
                    }
                }
            }
        }
    }
}
