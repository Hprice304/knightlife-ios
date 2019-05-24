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
            if Theme.userTheme == Theme.blue {
                return UIColor(hex: "051126")! // Blue Testing  000B2F
            }
            if Theme.userTheme == Theme.black {
                return UIColor.black
            }
            else {
                return UIColor.white
            }
        case .primaryBackground:
            if Theme.userTheme == Theme.blue {
                return UIColor(hex: "051126")! // Blue Testing 051126
            }
            if Theme.userTheme == Theme.black {
                return UIColor.black
            }
            else {
                return UIColor(hex: "efeff3")!
            }
        case .spacercolor:
            if Theme.userTheme == Theme.blue {
                return UIColor(hex: "000d23")! // Blue Testing  001428
            }
            if Theme.userTheme == Theme.black {
                return UIColor(hex: "1e1e1f")!
            }
            else {
                return UIColor(hex: "efeff3")!
            }
        case .backgroundColor:
            return UIColor.groupTableViewBackground
        case .text_black:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.white
            }
            else {
                return UIColor(hex: "9e9ea3")!
            }
        case .navtext:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.white
            }
            else {
                return UIColor.darkText
            }
        case .text:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.white
            }
            else {
                return UIColor.darkGray
            }
        case .lightText:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.lightGray
            }
            else {
                return UIColor.lightGray
            }
        case .nullColor:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.white
            }
            else {
                return UIColor(hex: "848484")!
            }
        case .hollowText:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.white
            }
            else {
                return UIColor(hex: "9F9FAA")!
            }
        case .dividerColor:
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
                return UIColor.darkGray
            }
            else {
                return UIColor(hex: "E1E1E6")!
            }
        case .titlecolor:
            if Theme.userTheme == Theme.blue {
                return UIColor(hex: "051126")!  // Blue Testing 000e2b, 051126
            }
            if Theme.userTheme == Theme.black {
                return UIColor(hex: "111111")!
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
            if Theme.userTheme == Theme.blue || Theme.userTheme == Theme.black {
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
