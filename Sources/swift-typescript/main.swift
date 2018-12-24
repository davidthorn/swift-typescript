print("hello world from the new main swift")

let div = HTMLDivElement(id: "my-element")
div.add(className: "active")
div.add(className: "dog")
let result = div.render()
print(result)