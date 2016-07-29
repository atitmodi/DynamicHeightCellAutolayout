//
//  DynamicHeightCellAutolayout.swift
//  DynamicCellHeight
//
//  Created by Atit Modi on 7/22/16.
//  Copyright © 2016 Atit Modi. All rights reserved.

import UIKit


struct Constants
{
    static let noOfTabs = 5
    static let padding = UIScreen.mainScreen().bounds.size.width * 0.03 //3% of the whole screen width is margin or padding
}

struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.currentDevice().userInterfaceIdiom == .Phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
}

struct EventContainer
{
    static let eventImgWidth = ScreenSize.SCREEN_WIDTH * 0.94 //0.94 because 0.06 from both the sides of the phone 
    static let eventImgHeight = EventContainer.eventImgWidth / 2.21 // 2.38 the actual image aspect ratio
    static let bottomViewHeight = EventContainer.eventImgWidth * 0.14 //bottomView will be 14% of the image width
}
