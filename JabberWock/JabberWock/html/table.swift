//
//  table.swift
//  JabberWock
//
//  Created by 清水 一征 on 2017/01/02.
//  Copyright © 2017年 momiji-mac. All rights reserved.
//

import Foundation


/*
 <table border=1>
 <caption> cation </caption>
 <tr><th></th><th>列-A</th><th>列-B</th></tr>
 <tr><td>行-1</td><td>A-1</td><td>B-1</td></tr>
 <tr><td>行-2</td><td>A-2</td><td>B-2</td></tr>
 <tr><td>行-3</td><td>A-3</td><td>B-3</td></tr>
 </table>
 
 */
class TABLE : JWMulti {
   
    var caption: String         = ""
    var headerList : [String]   = []
    var dataList : [[String]]     = []
    
    func setCaption(cap:String) {
        caption = cap
    }
    
    func setHeadList(header: [String]) {
        self.headerList = header
    }
    
    func setData(d: [[String]]) {
        dataList = d
    }
    

    override init() {
        super.init()
        self.openString     = "<table>"
        self.closeString    = "</table>"
    }
    
    private func addCation () {
        
        if caption != "" {
            let c = TableCaption()
            c.content = caption
            childString.append(c.tgStr())
        }
    }
    
    private func addTableHeader () {

        if headerList.count > 0 {
            var headerString = ""
            let tr = TableRow()
         
            let h0 = TableHeader(content: "")
            headerString += h0.tgStr()
            for hl  in headerList {
                let h = TableHeader(content: hl)
                headerString += h.tgStr()
            }
            
            tr.content = headerString
            childString.append(tr.tgStr())
        }
        
    }
    
    func addTableData(index : Int) {
        if headerList.count > 0 {
            var dataString = ""
            let tr = TableRow()
            
            for hl  in dataList[index] {
                let h = TableData(content: hl)
                dataString += h.tgStr()
            }
            
            tr.content = dataString
            childString.append(tr.tgStr())
        }
        
        
    }
    
    override func assemble() {
        addCation()
        addTableHeader()
        for i in 0..<dataList.count {
            self.addTableData(index: i)
        }
        
        makeResult()
    }
    

    
}

class TableCaption: JWSingle {
    
    override func initilizer() {
        self.openString = "<captiom>"
        self.closeString = "</caption>"
        
    }
    
}

class TableRow: JWSingle {
    
    override func initilizer() {
        self.openString = "<tr>"
        self.closeString = "</tr>"

    }
    
    
}

class TableHeader: JWSingle {
    
    
    override func initilizer() {
        self.openString = "<th>"
        self.closeString = "</th>"
        
    }
}

class TableData: JWSingle {
    
    private var rowSpan = 0
    private var colSpan = 0
    
    let INS_ROW_SPAN = "insert row span"
    let INS_COL_SPAN = "insert col span"
    
    override func initilizer() {
        self.openString = "<td" + INS_ROW_SPAN + SPC + INS_COL_SPAN + ">"
        self.closeString = "</td>"
    }
    
    
    func isRowSpan(str : String) -> Bool {
        return str.contains(ROW_SPAN)
    }
    
    func isColSpan(str: String) -> Bool {
        return str.contains(COL_SPAN)
    }
    
    func separateRowSpanNumber (str: String) -> [String] {
        return str.components(separatedBy: ROW_SPAN)
    }
    
    func separateColSpanNumber (str: String) -> [String] {
        return str.components(separatedBy: COL_SPAN)
    }
    
    
    func insertSpan () {
        
        if content.contains(ROW_SPAN) || content.contains(COL_SPAN){
            let a = content.components(separatedBy: COMMA)
            
            for val in a {
                if isRowSpan(str: val) {
                    let a = separateRowSpanNumber(str: val)
                    rowSpan = Int(a[1])!
                    
                }else if isColSpan(str: val) {
                    let b = separateColSpanNumber(str: val)
                    colSpan = Int(b[1])!
                    
                }else {
                    content = val
                }
                
            }
            
        }
    
        
        if rowSpan > 0 {
            openString = openString.replacingOccurrences(of: INS_ROW_SPAN, with: " rowspan=\(rowSpan)")
        }else{
            openString = openString.replacingOccurrences(of: INS_ROW_SPAN, with: "")
        }
        
        if colSpan > 0 {
            openString = openString.replacingOccurrences(of: INS_COL_SPAN, with: " colspan=\(colSpan)")
        }else{
            openString = openString.replacingOccurrences(of: INS_COL_SPAN, with: "")
        }
    }
    
    override func assemble() {
        insertSpan()
        makeResult()
    }

    
}

