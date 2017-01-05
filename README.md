# JabverWock ( rename:JabberWock )
## > 何がしたい?
	どうしてWebページを作成するのにHTMLとCSSとJavaScripを
	書かなければいけないのか？
    すべてをSwiftで書いてしまえれば楽なのに！
    という実験である。
	
    
##  sample 1

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
