//
//  DynamicHeightCellAutolayout.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.
//

import UIKit

extension UIImage
{
    func makeImageWithColorAndSize(color: UIColor, size: CGSize) -> UIImage
    {
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(CGRectMake(0, 0, 100, 100))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}