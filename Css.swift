//
//  Css.swift
//  JabberWockSample1
//
//  Created by kazuyuki shimizu on 2016/07/06.
//  Copyright © 2016年 Momiji-mac.com. All rights reserved.
//

import Foundation

enum VerticalAlign: Int {
    case BaseLine
    case Top
    case Middle
}
enum Background : Int {
    case transparent
    case MAX
}

class Css {
 
//    margin:0;
//    padding:0;
//    border:0;
//    outline:0;
//    font-size:100%;
//    vertical-align:baseline;
//    background:transparent;
    
    var margin          = 0
    var padding         = 0
    var border          = 0
    var outline         = 0
    var fontSizePercent = 100     //     font-size:100%;
    var verticalAlign   = VerticalAlign.BaseLine //     vertical-align:baseline;
    var background      = Background.transparent
}