//
//  Author.swift
//  PatternsTest
//
//  Created by German Rincon Urrego on 6/06/21.
//

import Foundation

public class Author: NSCopying {

    private(set) var id: Int
    private(set) var username: String
    private(set) var pages = [Page]()
    private var numberCopies: Int = 0

    init(id: Int, username: String) {
        self.id = id
        self.username = username
    }

    func add(page: Page) {
        pages.append(page)
    }

    var pagesCount: Int {
        return pages.count
    }
    
    var name: String{
        return "\(self.username) \(self.id)"
    }
    
    public func copy(with zone: NSZone? = nil) -> Any {
        numberCopies += 1
        let copyAuthor = Author(id: numberCopies, username: "Copy of \(username)")
        pages.forEach { page in
            copyAuthor.add(page: page.copy() as! Page)
        }
        return copyAuthor
    }
}
