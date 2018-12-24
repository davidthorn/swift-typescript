


let _bodyElement = body { p in

    p.child("wrapper") { e in

        e.h1("Main Title")
        e.p("my long text which I want to use")
       
    }

}

// let myElement = div("my-element") { ele in
    
//     ele.add(classNames: ["active" , "dog"])

//     ele.child("my-inner" ) { cn in
        
//         cn.add(classNames: ["fruit"])

//     }

//     return ele
// }


let result = _bodyElement.render()
print(result)