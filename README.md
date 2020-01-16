# PygmentsPublishPlugin

A work in progress implemntation of a pygments plugin for use with [Publish](https://github.com/johnsundell/publish).

# Install

Install pygments on your machine.
```
pip3 install pygments
```

In your Package.swift add:
```swift
.package(url: "https://github.com/TG908/PygmentsPublishPlugin.git", from: "0.0.4")
```

# Setup

To load the plugin simply add these lines:

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
