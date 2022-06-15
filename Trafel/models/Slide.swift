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
        Slide(imageName: "imSlide1", title: "Contrary to popular belief", description: "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum"),
        Slide(imageName: "imSlide2", title: "anything", description: "embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary"),
        Slide(imageName: "imSlide3", title: "making this the ", description: "first true generator on the Internet. It uses a dictionary of over 200 Latin words"),
    ]
}
