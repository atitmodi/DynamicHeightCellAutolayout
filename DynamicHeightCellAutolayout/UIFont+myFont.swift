//
//  DynamicHeightCellAutolayout.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.

import UIKit

extension UIFont
{
    class func myFont(size : CGFloat, bold : Bool = false) -> UIFont
    {
        if !bold
        {
            return UIFont(name: "Roboto", size: size)!
        }
        else
        {
            return UIFont(name: "Roboto-Bold", size: size)!
        }
    }
}
