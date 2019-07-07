//
//  CoreImage.swift
//  函数式
//
//  Created by Rudy on 2019/7/7.
//  Copyright © 2019 Rudy. All rights reserved.
//

import Foundation
import CoreImage
import UIKit

typealias Filter = (CIImage) -> CIImage

func blur(radius:Double) -> Filter {
    return { image in
        let para = [
            kCIInputRadiusKey:radius,
            kCIInputImageKey:image
            ] as [String : Any]
        guard let filter = CIFilter(name: "CIGaussianBlur", parameters: para) else {fatalError()}
        guard let outputImage = filter.outputImage else {fatalError()}
        return outputImage
    }
}

func colorGenerator(color:UIColor) -> Filter {
    return { _ in
        let par = [kCIInputColorKey:CIColor(color: color)]
        guard let filter = CIFilter(name: "CIConstantColorGenerator", parameters: par) else {fatalError()}
        guard let outputImage = filter.outputImage else {fatalError()}
        return outputImage
    }
}
