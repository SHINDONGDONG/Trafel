//
//  Helper.swift
//  Trafel
//
//  Created by 申民鐡 on 2022/06/12.
//

import Foundation

func delay(durationInSeconds: Double, completion: @escaping () -> Void) {
    
    DispatchQueue.main.asyncAfter(deadline: .now()+durationInSeconds, execute: completion)
}
