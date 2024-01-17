Copy code
# MakeConstraint

A Swift library for creating Auto Layout constraints programmatically with ease.

## Overview

The `MakeConstraint` library simplifies the process of creating Auto Layout constraints in your Swift application. It offers a concise and convenient way to define constraints for the edges and size of a `UIView` programmatically. This package helps you reduce boilerplate code when working with Auto Layout, making your code cleaner and more maintainable.

## Features

- Create constraints for the top, leading, bottom, and trailing edges of a `UIView`.
- Specify centerX and centerY constraints.
- Customize size constraints.
- Fills the view within its superview

## Usage

### Anchored Constraints
```swift
import MakeConstraint

let redView = UIView()
view.addSubview(redView)

// Create constraints to pin the redView to the top and leading edges with a padding of 20.
redView.makeConstraints(
    topAnchor: view.topAnchor,
    leadingAnchor: view.leadingAnchor,
    padding: UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 0)
)
```
You can customize various parameters, including the top, leading, bottom, trailing anchors, centerX, centerY anchors, padding values, and size constraints.

## Centering in Superview
```swift
import MakeConstraint

let blueView = UIView()
view.addSubview(blueView)

// Center the blueView within its superview and adjust the X and Y position.
blueView.centerInSuperview(xConstant: 10, yConstant: -10)
```
You can also center a view horizontally or vertically within its superview using the centerXInSuperview and centerYInSuperview functions, respectively.

## Filling a View
You can use the fillSuperview function to fill a view within its superview with optional padding on all sides. Additionally, the fillXSuperView and fillYSuperView functions allow you to fill a view horizontally or vertically within its superview with padding on the leading, trailing, top, and bottom sides.

```swift
import MakeConstraint

let greenView = UIView()
view.addSubview(greenView)

// Fill the greenView within its superview with 10 points of padding on all sides.
greenView.fillSuperview(padding: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
```

## Working with Dimensions and Constraints
You can conveniently work with view dimensions and constraints using the following methods:

width and height properties provide the width and height of the view.
widthConstraints(_:) creates a width constraint for the view with the specified constant.
heightConstraints(_:) creates a height constraint for the view with the specified constant.
equalSizeConstraints(_:) creates equal width and height constraints for the view with the specified constant.
sizeConstraints(width:height:) creates width and height constraints for the view with specified width and height constants.
Here are some examples:
```swift
import MakeConstraint

let view = UIView()

// Access the width and height properties.
let viewWidth = view.width
let viewHeight = view.height

// Create a width constraint for the view.
view.widthConstraints(100)

// Create an equal size constraint for the view.
view.equalSizeConstraints(50)

// Create custom size constraints for the view.
view.sizeConstraints(width: 80, height: 60)
```

Author
[Ahmed Yamany](https://www.linkedin.com/in/ahmed-yamany/)
