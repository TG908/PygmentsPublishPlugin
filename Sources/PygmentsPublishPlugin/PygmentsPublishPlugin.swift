
import Publish
import Ink
import ShellOut

public extension Plugin {
    static func pygmentize() -> Self {
        Plugin(name: "Pygments") { context in
            context.markdownParser.addModifier(
                .pygmentizeCodeBlocks()
            )
        }
    }
}

public extension Modifier {
    static func pygmentizeCodeBlocks() -> Self {
        return Modifier(target: .codeBlocks) { html, markdown in
            
            let begin = markdown.components(separatedBy: .newlines).first ?? "```"
            let language = begin.dropFirst("```".count)
            
            var markdown = markdown.dropFirst(begin.count)

            guard language != "no-highlight" else {
                return html
            }
            
            markdown = markdown
                .drop(while: { !$0.isNewline })
                .dropFirst()
                .dropLast("\n```".count)
            
            if let highlighted = try? shellOut(to: "echo \"\(String(markdown))\" | /usr/local/bin/pygmentize -s -l \(String(language)) -f html -O nowrap") {
                return "<pre><code>" + highlighted + "\n</code></pre>"
            }
            return "<pre><code>" + String(markdown) + "\n</code></pre>"
        }
    }
}
