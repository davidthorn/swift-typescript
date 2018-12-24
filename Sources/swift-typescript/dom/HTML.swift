public func body( _ n: (_ node: HTMLBodyElement ) -> Void) -> HTMLBodyElement {
    let body_element = document.bodyElement
    n(body_element)
    return body_element
}

public func head( _ n: (_ node: HTMLHeadElement ) -> Void) -> HTMLHeadElement {
    let head_element = document.headElement
    n(head_element)
    return head_element
}

public func scriptTag( _ src: String , _ n: (_ node: HTMLScriptTag ) -> HTMLScriptTag) -> HTMLScriptTag {
    let tag = n(HTMLScriptTag(src: src))
    document.headElement.add(script: tag)
    return tag
}

public func linkTag( _ href: String , _ rel: String , _ n: (_ node: HTMLLinkTag ) -> HTMLLinkTag) -> HTMLLinkTag {
    let tag = n(HTMLLinkTag(href: href , rel: rel))
    document.headElement.add(link: tag)
    return tag
}

public func div( _ id: String? = nil , _ n: (_ node: HTMLDivElement ) -> HTMLDivElement) -> HTMLDivElement {
    return n(HTMLDivElement(id: id))
}

public func h1Tag(_ text: String, _ id: String? = nil , _ n: (_ node: HTMLH1Element ) -> HTMLH1Element) -> HTMLH1Element {
    return n(HTMLH1Element(text, id: id))
}


public func pTag(_ text: String, _ id: String? = nil , _ n: (_ node: HTMLParagraphElement ) -> HTMLParagraphElement) -> HTMLParagraphElement {
    return n(HTMLParagraphElement(text, id: id))
}

