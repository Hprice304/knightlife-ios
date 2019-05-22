//
//  Scheme.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/1/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation
import UIKit

enum Scheme {
    
    case blue
    
    case main
    case spacercolor
    case backgroundColor
    
    case text
    case lightText
    case Backgrounddark
    
    case navtext
    case nullColor
    case hollowText
    case dividerColor
    case text_black
    
    case titlecolor
    case primaryBackground
    case barNullColor
    
//    How this works
//    Darkmanager.instance.show returns a boolean value
//    which changes the color scheme of everything
//    DarkManager.swift controlls that switch

    var color: UIColor {
        switch self {
        case .blue:
            return UIColor(hex: "4481eb")!
        case .main:
            return UIColor.white
        case .Backgrounddark:
            if DarkManager.instance.showDark == true {
//                return UIColor.black
                return UIColor(hex: "051126")! // Blue Testing  000B2F
            }
            else {
                return UIColor.white
            }
        case .primaryBackground:
            if DarkManager.instance.showDark == true {
//                return UIColor.black
                return UIColor(hex: "051126")! // Blue Testing 051126
            }
            else {
                return UIColor(hex: "efeff3")!
            }
        case .spacercolor:
            if DarkManager.instance.showDark == true {
//                return UIColor(hex: "1e1e1f")!
                return UIColor(hex: "000d23")! // Blue Testing  001428
            }
            else {
                return UIColor(hex: "efeff3")!
            }
        case .backgroundColor:
            return UIColor.groupTableViewBackground
        case .text_black:
            if DarkManager.instance.showDark == true {
                return UIColor.white
            }
            else {
                return UIColor(hex: "9e9ea3")!
            }
        case .navtext:
            if DarkManager.instance.showDark == true {
                return UIColor.white
            }
            else {
                return UIColor.darkText
            }
        case .text:
            if DarkManager.instance.showDark == true {
                return UIColor.white
            }
            else {
                return UIColor.darkGray
            }
        case .lightText:
            if DarkManager.instance.showDark == true {
                return UIColor.lightGray
            }
            else {
                return UIColor.lightGray
            }
        case .nullColor:
            if DarkManager.instance.showDark == true {
                return UIColor.white
            }
            else {
                return UIColor(hex: "848484")!
            }
        case .hollowText:
            if DarkManager.instance.showDark == true {
                return UIColor.white
            }
            else {
                return UIColor(hex: "9F9FAA")!
            }
        case .dividerColor:
            if DarkManager.instance.showDark == true {
                return UIColor.darkGray
            }
            else {
                return UIColor(hex: "E1E1E6")!
            }
        case .titlecolor:
            if DarkManager.instance.showDark == true {
//                return UIColor.black
                return UIColor(hex: "051126")!  // Blue Testing 000e2b, 051126
            }
            else {
                return UIColor(hex: "#f8f8fa")!
            }
        case .barNullColor:
            return UIColor(hex: "848484")!
        }
    }
}

enum StyleScheme {
    
    //    nav bar stuff
    
    case stylecolorblack
    case styleReg
    
    var styleColor: UIBarStyle {
        switch self {
        case .styleReg:
            if DarkManager.instance.showDark == true {
                return UIBarStyle.black
            }
            else {
                return UIBarStyle.default
            }
        case .stylecolorblack:
            return UIBarStyle.black
        }
    }
}
