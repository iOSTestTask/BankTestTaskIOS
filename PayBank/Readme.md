PayBank
========

## Architecture

We use **VIPER** - like approach for creating modules. VIPER is an application of Clean Architecture to iOS apps.  Clean Architecture divides an app’s logical structure into distinct layers of responsibility. 

The main parts of VIPER are:
**View**: displays what it is told to by the Presenter and relays user input back to the Presenter.
**Interactor** : contains the business logic as specified by a use case.
**Presenter**: contains view logic for preparing content for display (as received from the Interactor) and for reacting to user inputs (by requesting new data from the Interactor).
**Entity**: contains basic model objects used by the Interactor.
**Routing**: contains navigation logic for describing which screens are shown in which order.

More detail you could find [here](https://www.objc.io/issues/13-architecture/viper/)

To create a new VIPER-module use
```shell
generamba gen <Name> swifty_viper --module_path '/Module_Path'
```
more info [here](https://github.com/rambler-digital-solutions/Generamba).

We use pattern to manage app flows. The Coordinator is main responsibility is to handle all the logic for presentation between View Controllers. More detail you could find [here](https://medium.com/blacklane-engineering/coordinators-essential-tutorial-part-i-376c836e9ba7)


You could see our arhitecture solutions [here](https://drive.google.com/file/d/1AfnIwSbimrPXOjed2HV6hLbDYZ3KdGDQ/view?usp=sharing) and navigation arhitecture [here](https://drive.google.com/file/d/1dfDNj7WEjwdOWw975ik_mCuA_idgDSf7/view?usp=sharing)

We use [Swinject](https://github.com/Swinject) to manage DI.


## Flow diagrams

You coul find authorize flow diagram [here](https://drive.google.com/file/d/1jBeDIRoB8_tX7t_TKhlHZUKvX6sfvCbB/view?usp=sharing) and main flow diagram [here](https://drive.google.com/file/d/1zS77GI0ZEEe4pvIswZFm-4gPrxyFJnF6/view?usp=sharing)


## Code Style

Please, take a look at our [code style](https://github.com/raywenderlich/swift-style-guide). 

[SwiftLint](https://github.com/realm/SwiftLint) helps us to keep code neat and tidy, so be sure to do your best to minimize amount of warnings from it.


## Notes

We  use logging (for API) only in debug mode to prevent theft of important data. 


