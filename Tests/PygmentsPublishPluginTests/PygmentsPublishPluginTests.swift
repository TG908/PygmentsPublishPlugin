import XCTest
@testable import PygmentsPublishPlugin
import Ink

final class PygmentsPublishPluginTests: XCTestCase {
    func testHighlightingMarkdown() {
        
        let parser = MarkdownParser(modifiers: [.pygmentizeCodeBlocks()])
        let html = parser.html(from: """
        Some text
        ```swift
        let int = 7
        ```
        More text
        ```no-highlight
        not.highlighted()
        ```
        """)

        print(html)
    }

    static var allTests = [
        ("testHighlightingMarkdown", testHighlightingMarkdown)
    ]
}
