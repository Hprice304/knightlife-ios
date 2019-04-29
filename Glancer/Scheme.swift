//
//  Scheme.swift
//  Glancer
//
//  Created by Dylan Hanson on 11/1/17.
//  Copyright © 2017 BB&N. All rights reserved.
//

import Foundation
import UIKit
//Dark Mode

enum Scheme {
    
    case blue

    case main
    case spacercolor
    case backgroundColor

    case darkText
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

    var color: UIColor {
        switch self {
        case .blue:
            return UIColor(hex: "4481eb")!
        case .main:
            return UIColor.white
        case .Backgrounddark:
            if LunchManager.instance.showAllergens == true {
                return UIColor.black
            }
            else {
                return UIColor.white
            }
        case .primaryBackground:
            if LunchManager.instance.showAllergens == true {
                return UIColor.black
            }
            else {
                return UIColor(hex: "efeff3")!
            }
        case .spacercolor:
            if LunchManager.instance.showAllergens == true {
                return UIColor(hex: "1e1e1f")!
            }
            else {
                return UIColor(hex: "efeff3")!
//                efeff3
//                F8F8FA
            }
        case .backgroundColor:
            return UIColor.groupTableViewBackground
        case .darkText:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor.darkText
            }
        case .text_black:
            return UIColor.black
        case .navtext:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor.darkText
            }
        case .text:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor.gray
            }
        case .lightText:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor.lightGray
            }
        case .nullColor:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor(hex: "848484")!
            }
        case .hollowText:
            if LunchManager.instance.showAllergens == true {
                return UIColor.white
            }
            else {
                return UIColor(hex: "9F9FAA")!
            }
        case .dividerColor:
            if LunchManager.instance.showAllergens == true {
                return UIColor(hex: "88888b")!
            }
            else {
                return UIColor(hex: "E1E1E6")!
            }
        case .titlecolor:
            if LunchManager.instance.showAllergens == true {
                return UIColor.black
            }
            else {
                return UIColor(hex: "#f8f8f9")!
            }
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
            if LunchManager.instance.showAllergens == true {
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

// White mode
//enum Scheme {
//
//    case blue
//
//    case main
//    case spacercolor
//    case backgroundColor
//
//    case darkText
//    case text
//    case lightText
//    case Backgrounddark
//
//    case navtext
//    case nullColor
//    case hollowText
//    case dividerColor
//    case text_black
//
//    var color: UIColor {
//        switch self {
//        case .blue:
//            return UIColor(hex: "4481eb")!
//        case .main:
//            return UIColor.white
//        case .Backgrounddark:
//            return UIColor.white
//        case .spacercolor:
//            return UIColor(hex: "F8F8FA")!
//        case .backgroundColor:
//            return UIColor.groupTableViewBackground
//        case .darkText:
//            return UIColor.darkText
//        case .text_black:
//            return UIColor.black
//        case .navtext:
//            return UIColor.darkText
//        case .text:
//            return UIColor.darkGray
//        case .lightText:
//            return UIColor.lightGray
//        case .nullColor:
//            return UIColor(hex: "848484")!
//        case .hollowText:
//            return UIColor(hex: "9F9FAA")!
//        case .dividerColor:
//            return UIColor(hex: "E1E1E6")!
//
//        }
//    }
//}





