//
//  Page.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 6/06/21.
//

import Foundation

public class Page: NSCopying {

    private(set) var title: String
    private(set) var contents: String
    private weak var author: Author?
    private(set) var comments = [Comment]()

    init(title: String, contents: String, author: Author?) {
        self.title = title
        self.contents = contents
        self.author = author
        author?.add(page: self)
    }

    func add(comment: Comment) {
        comments.append(comment)
    }

    /// MARK: - NSCopying
    public func copy(with zone: NSZone? = nil) -> Any {
        let page = Page(title: "Copy of '" + title + "'", contents: contents, author: author)
        comments.forEach { comment in
            page.add(comment: comment)
        }
        return page
    }
}

public struct Comment {

    let date = Date()
    let message: String
}
