//
//  Slide.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/15.
//

import Foundation

struct Slide {
    let imageName: String
    let title:String
    let description:String


    static let collection: [Slide] = [
        Slide(imageName: "imSlide1", title: "Welcome to Trafel", description: "Trafel is Your Travel Surpport"),
        Slide(imageName: "imSlide2", title: "Welcome to Trafel", description: "Trafel is Your Travel Surpport"),
        Slide(imageName: "imSlide3", title: "Welcome to Trafel", description: "Trafel is Your Travel Surpport"),
    ]
}
