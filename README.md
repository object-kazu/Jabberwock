# JabverWock ( rename:JabberWock )
## What is this?
	どうしてWebページを作成するのにHTMLとCSSとJavaScripを
	書かなければいけないのか？
    すべてをSwiftで書いてしまえれば楽なのに！
    という実験である。
	
    
##  Sample 1

```
      //head
        let head = HEAD()
        
        let meta = META()
        meta.setCharset(of: CHARSET.utf8)
        
        let title = TITLE(content: "task")
        
        head.addChild(child: meta)
        head.addChild(child: title)
        
        //body
        let body = BODY()
        let h1 = HEADING(level: 1, content: "This is TODO")
        let a = "My first task"
        let b = B(content: "Next TODO").tgStr()
        let c = STRONG(content: "1. html").tgStr()
        let pa = P(content: a)
        let pb = P(content: b)
        let pc = P(content: c)
        
        body.addChild(child: h1)
        body.addChild(child: pa)
        body.addChild(child: pb)
        body.addChild(child: pc)
        
        
        html.addChild(child: head)
        html.addChild(child: body)
        
        doc.addMember(member: html)
        doc.press()
        
```
output

```
         <!DOCTYPE html>
         <html lang="en">
            <head>
                <meta charset="UTF-8""/>
                <title>task</title>
            </head>
            <body>
                <h1>This is TODO</h1>
                <p>My first task</p>
                <p><b>Next TODO</b></p>
                <p><strong>1. html</strong></p>
         
            </body>
         </html>

```
# License

Jabverwock is distributed under MIT license.

Copyright (c) 2016 Kazuyuki Shimizu

Permission is hereby granted, free of charge, to any person obtaining a
copy of this software and associated documentation files (the "Software"),
to deal in the Software without restriction, including without limitation
the rights to use, copy, modify, merge, publish, distribute, sublicense,
and/or sell copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
DEALINGS IN THE SOFTWARE.