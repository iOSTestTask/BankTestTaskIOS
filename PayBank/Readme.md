PayBank
========

## Architecture

We use [VIPER](https://medium.com/flawless-app-stories/implementing-viper-archticture-pattern-for-ios-d24a6def8ba2 )-like approach for creating modules.

To create a new VIPER-module use
```shell
generamba gen <Name> swifty_viper --module_path '/Module_Path'
```
more info [here](https://github.com/rambler-digital-solutions/Generamba).

We use [Coordinator](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7) pattern to manage app flows.

We use [Swinject](https://github.com/Swinject) to manage DI.

## Code Style

Please, take a look at our [code style](https://github.com/raywenderlich/swift-style-guide). 

[SwiftLint](https://github.com/realm/SwiftLint) helps us to keep code neat and tidy, so be sure to do your best to minimize amount of warnings from it.

