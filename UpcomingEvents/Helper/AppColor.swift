//
//  AppColor.swift
//  UpcomingEvents
//
//  Created by Jose David Sanluis Castillo on 13/10/21.
//

import Foundation
import UIKit

protocol ColorsType {
    static var main: UIColor { get }
    static var blue: UIColor { get }
    static var lightBlue: UIColor { get }
    static var darkBlue: UIColor { get }
    static var alphaBlue: UIColor { get }
}

struct AppColors: ColorsType {
    
    static var main: UIColor = .from(rgb: 0x2870C9)
    static var blue: UIColor = .from(rgb: 0x005AA2)
    static var lightBlue: UIColor = .from(rgb: 0x2870C9)
    static var gray: UIColor = .from(rgb: 0x787F88)
    static var darkGray: UIColor = .from(rgb: 0x525A66)
    static var hallwayGray: UIColor = .from(rgb: 0x718096)
    static var hallwayBlue: UIColor = .from(rgb: 0x0071CE)
    static var custom: UIColor = .clear
    static var darkBlue: UIColor { .from(rgb: 0x004D86) }
    static var lightGray: UIColor { .from(rgb: 0xEDEDEE) }
    static var alphaBlue: UIColor { .blue }
}

public extension UIColor {
    static func from(rgb: UInt) -> UIColor {
        UIColor(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
