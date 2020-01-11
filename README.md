# PygmentsPublishPlugin

A work in progress implemntation of a pygments plugin for use with [Publish](https://github.com/johnsundell/publish).

# Install

`pip3 install pygments`

```swift
.package(url: "https://github.com/TG908/PygmentsPublishPlugin.git", from: "0.0.4")
```

# Setup

```swift

import PygmentsPublishPlugin

...

try MyWebsite().publish(
    ...
    plugins: [.pygmentize(withClassPrefix: "")]
])
```

# CSS

You'll also need to add some CSS. Check out these [examples](https://github.com/richleland/pygments-css)
