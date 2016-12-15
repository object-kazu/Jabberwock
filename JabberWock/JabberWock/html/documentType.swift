//
//  documentType.swift
//  JabberWock
//
//  Created by kazuyuki shimizu on 2016/12/08.
//  Copyright © 2016年 momiji-mac. All rights reserved.
//

import Foundation

class DOCTYPE:JW {
    var docType:String = "<!DOCTYPE html>"

    override init() {
        super.init()
        resultString = docType
    }
    
}
