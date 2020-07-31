//
//  WebImageExample.swift
//  WebImageDemo
//
//  Created by Derek Chan on 2020/7/31.
//

import SwiftUI
import SDWebImageSwiftUI

struct WebImageExample: View {
    let url: URL?
    
    var body: some View {
        WebImage(url: url)
            .placeholder { Color.gray }
            .resizable()
            .onSuccess(perform: { (_, _, _) in
                print("Succeed")
                SDWebImageManager.shared.imageCache.clear(with: .all, completion: nil)//清除图片缓存
            })
            .onFailure(perform: { (_) in
                print("Failure")
            })
            .scaledToFill()
            .frame(height: 600)
            .clipped()
    }
}
