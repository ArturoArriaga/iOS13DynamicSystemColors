//
//  File.swift
//  iOS13DynamicSystemColors
//
//  Created by Art Arriaga on 2/20/20.
//  Copyright © 2020 ArturoArriaga.IO. All rights reserved.
//

import UIKit

/* In iOS 13, Apple introduced palate of UIColors that automatically adapt to dark mode. Apple explains that these Dynamic System Colors are semantically defined to conveys purpose rather than its appearance or color values.*/

struct DynamicColor {
    let name: String
    let description: String
    let color: UIColor
}

//
let labelColors = [
    DynamicColor(name: "label", description: "The color for text labels that contain primary content.", color: UIColor.label),
    DynamicColor(name: "secondaryLabel", description: "The color for text labels that contain secondary content.", color: UIColor.secondaryLabel),
    DynamicColor(name: "tertiaryLabel", description: "The color for text labels that contain quaternary content.", color: UIColor.tertiaryLabel),
    DynamicColor(name: "quaternaryLabel", description: "The color for text labels that contain tertiary content.", color: UIColor.quaternaryLabel),

]

let systemFillColors = [
    DynamicColor(name: "systemFill", description: "An overlay fill color for thin and small shapes", color: UIColor.systemFill),
    DynamicColor(name: "secondarySystemFill", description: "An overlay fill color for medium-size shapes.", color: UIColor.secondarySystemFill),
    DynamicColor(name: "tertiarySystemFill", description: "An overlay fill color for large shapes.", color: UIColor.systemFill),
    DynamicColor(name: "quaternarySystemFill", description: "An overlay fill color for large areas that contain complex content.", color: UIColor.quaternarySystemFill),
]

let standardContentBackgroundColors = [
    DynamicColor(name: "systemBackground", description: "The color for the main background of your interface.", color: UIColor.systemBackground),
    DynamicColor(name: "secondarySystemBackground", description: "The color for content layered on top of the main background of your grouped interface.", color: UIColor.secondarySystemBackground),
    DynamicColor(name: "tertiarySystemBackground", description: "The color for content layered on top of secondary backgrounds.", color: UIColor.tertiarySystemBackground),
]


let groupedContentBackgroundColors = [
    DynamicColor(name: "systemGroupedBackground", description: "The color for the main background of your grouped interface.", color: UIColor.systemGroupedBackground),
    DynamicColor(name: "secondarySystemGroupedBackground", description: "The color for content layered on top of the main background of your grouped interface.", color: UIColor.secondarySystemGroupedBackground),
    DynamicColor(name: "tertiarySystemGroupedBackground", description: "The color for content layered on top of secondary backgrounds of your grouped interface.", color: UIColor.tertiarySystemGroupedBackground),
]


/* For extended reading, see the following links.
 
 UI Element Colors
 https://developer.apple.com/documentation/uikit/uicolor/ui_element_colors
 */

