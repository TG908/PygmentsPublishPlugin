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

        ```
        not.highlighted()
        ```
        """)

        let expectedHtml = "<p>Some text</p><pre><code><span class=\"kd\">let</span> <span class=\"nv\">int</span> <span class=\"p\">=</span> <span class=\"mi\">7</span>\n</code></pre><p>More text</p><pre><code class=\"language-no-highlight\">not.highlighted()\n</code></pre><pre><code>not.highlighted()\n</code></pre>"

        XCTAssertEqual(expectedHtml, html)

    }

    static var allTests = [
        ("testHighlightingMarkdown", testHighlightingMarkdown)
    ]
}
