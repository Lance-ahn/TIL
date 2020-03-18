//
//  Utils.swift
//  Casino
//
//  Created by macbook on 2020/03/10.
//  Copyright © 2020 Lance. All rights reserved.
//

import UIKit

extension UIImage{

    func spriteSheet(cols: UInt, rows: UInt) -> [UIImage] {
        let w = self.size.width / CGFloat(cols)
        let h = self.size.height / CGFloat(rows)
        
        var rect = CGRect(x: 0, y: 0, width: w, height: h)
        var arr : [UIImage] = []
        
        for _ in 0..<rows{
            for _ in 0..<cols{
                // crops
                let subImage = self.crop(rect)
                // add to array
                arr.append(subImage)
                
                //go to next image in row
                rect.origin.x += w
            }
            //go to next row
            rect.origin.x = 0
            rect.origin.y += h
            
        }
        // done, return the array
        return arr
    }
    
    func crop(_ rect : CGRect) -> UIImage {
        guard let imageRef = self.cgImage?.cropping(to: rect) else { return UIImage() }
        return UIImage(cgImage: imageRef)
    }
}

