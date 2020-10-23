#  Session 1 - Basic in Texture

The session covers the basic of `Texture` that is the introduction of `ASDisplayNode` and how to use it along with `node container`.
Also we will learn how to build a simple layout with `layoutSpecBlock`

## Guide

This session is labeled under `Start` inside the `Session 1 - Basic ` folder in the `Xcode` project example. We will code together on the subsection `Rendering Component in Texture Way`.

#### Rendering Component in `UIKit` Way

Before we learn the basics of `Texture`, it is better we take a look at how `UIKit` structuring the views to rendering component on screen first.
1. Run the project
2. Tap on `Basic UIKit`.

On the screen, you can see a colored box centering on the page. Open the `BasicUIKitViewController.swift` to see the implementation. You may be familiar with the code, how to set up the `viewcontroller`, the child view, and the constraints. We will create something similar to that by using `Texture`, so let's get started!


#### Rendering Component in `Texture` Way

#### A. Open `BasicTextureViewController.swift`
The file will look like this:

```swift
import UIKit

class BasicTextureViewController: UIViewController {
   
}
```
The `BasicTextureViewController` still inherit the `UIViewController` so we need to change the subclass


#### B. Change the subclass of `ViewController` into `ASDKViewController`

Before we change the subclass, we need to import the framework `Texture` by adding `import AsyncDisplayKit`.  Next we change the subclass `viewController` into `ASDKViewController<ASDisplayNode>`. Why we do have a generic on our `ViewController`?. This generic used to determined which type of `root node` we want to use. In this case we just need a plain `ASDisplayNode` as our root `node`.

```swift
import AsyncDisplayKit
import UIKit

class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
   
}
```
Note: In the Create `Product Card List Session` we will configure the `root node` with a different type of `ASDisplayNode`

#### C. Add initializer to the `ViewController`
Next, we need to create an initializer for our `viewController`. We can start by adding an empty `init()` but we need to add the `override` keyword before the init. The compiler will throw an error that we need to satisfy by adding `required init?(coder: NSCoder)`

```swift
......

class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
```

#### C. Create a root `Node` for `ViewController`

We have successfully changed our `ViewController` to `ASDKViewController` but the `viewController` shows a blank view with a black color background. That means our `root node`  has still not been configured yet, let's start by changing the init into `super.init(node: ASDisplayNode)`.

The parameter `node` means that we can use any kind of `ASDisplayNode` as our root `node` but let's stick with a simple `ASDisplayNode` for now.

We can change the background color or any property of the root `node` by accessing the `node.` property in our `ViewController`. It similar to when we are accessing the `view.` property in `UIViewController`.
Let's change the background color to `white` color

```swift
......
class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
    }
    ......
}
```

#### D. Add the rectangle box
Now the fun part begins, we will create a rectangle box as the child of  `ViewController`. Create the box by initialize `ASDisplayNode()`.To make the box see clearly on the screen we can add some color and set the size of the box. 

For the size, we can use `frame` property for now and let's start by adding a simple size by adding `subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300)`.

After that, add your box into your `viewController` by using `node.addSubNode(subNode)`, It similar to `UIKit` `view.addSubview.`

```swift
......
class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
        
        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
        subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        node.addSubnode(subNode)
    }
    ......
}
```

#### E. Configure Layout by using `LayoutSpecBlock`

The box is showing up, but what are the advantages of layouting in `Texture`? it looks similar to `UIKit`.

Introduction: `LayoutSpecBlock`
`LayoutSpecBlock` is a closure where you play around with the layout. This is where the `Flexbox` concept is applied. The `LayoutSpecBlock` has 2 parameters:
- `node`: the `node` itself
- `constrainedSize`: the size of the root `node`

We don't need those 2 parameters for now so just omit them using `_, _`. The block needs a return type of `ASLayoutSpec` which is the kind of layout we want to use. There are many types of layout that we will learn in this workshop but for now, we will use `ASCenterLayout` to center the node.

```swift
......
class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
        
        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
        subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
        node.addSubnode(subNode)
        node.layoutSpecBlock = { _, _ in
            return ASCenterLayoutSpec(centeringOptions: .XY,
                                      sizingOptions: [],
                                      child: subNode)
        }
    }
    ......
}
```

The `ASCenterLayout` has 3 parameters:
- `centeringOptions`: the position of the child, We use the `.XY`  value that means we will center the child on `Horizontal` and `Vertical` position.
- `sizingOptions`: how much space the center spec will take up. We don't need this configuration right now instead we can use an empty value `[]`.
- `child`: the node that will be centered, in this case, is `subNode` object.

The result is not the same as we not expected, the child node covers the whole screen, to fix that we can go to the next step.


#### F. Adjust box size by using `style.preferredSize`

Why did the `child node` cover the whole screen? the answer is we haven't set the size yet. We already set the size before on `.frame` but because right now we are using `layoutSpecBlock` the `frame` value is no longer valid. The goal of `layoutSpecBlock` is to apply the `FlexBox` concept which means we don't need to calculate the position & size manually. So let's fix the size. 
By adding the `style.preferredSize`, we specified a constant size to our `child node`.

```swift
......
class BasicTextureViewController: ASDKViewController<ASDisplayNode> {
    override init() {
        super.init(node: ASDisplayNode())
        node.backgroundColor = .white
        
        let subNode = ASDisplayNode()
        subNode.backgroundColor = .orange
        // Change this
        // subNode.frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        // Into this
        subNode.style.preferredSize = CGSize(width: 300, height: 300)
        
        node.addSubnode(subNode)
        node.layoutSpecBlock = { _, _ in
            return ASCenterLayoutSpec(centeringOptions: .XY,
                                      sizingOptions: [],
                                      child: subNode)
        }
    }
   ......
}

```

Cool! Finally, we have successfully created a simple component using `Texture` by creating a node, plug it into `viewController`, and configure the layout using `layoutSpecBlock`. In the next session, we will explore various `LayoutSpecs`!
