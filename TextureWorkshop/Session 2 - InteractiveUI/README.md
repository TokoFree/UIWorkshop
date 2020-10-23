#  Session 2 - Layouting with LayoutSpec in Texture

This session covers the various types of `LayoutSpec` that we can use to configure the layouting of elements in our `ViewController` as well as creating a custom/reusable node of `ASDisplayNode` type.


## Guide

This session is labelled under `ASLayoutSpec - Interactive` in the XCode project example.
The files used in this session is under `Session 2 - InteractiveUI`.

#### LayoutSpec

- For each `LayoutSpec` (e.g.: `ASInsetLayoutSpec`), there will be a folder containing 2 files.
- `FooLayoutVC` contains the real implementation of the `LayoutSpec`
- `FooLayoutVCInteractive` contains a bordered sandbox which displays the view of `FooLayoutVC` scaled to the size of the sandbox
- `FooLayoutVCInteractive` also contains a set of labelled buttons for the audience to configure the arguments used in the relative `LayoutSpec`

#### Layout Breakdown

We have created 2 `ViewControllers` that implement a layout that uses a combination of different `LayoutSpecs`.
In this session, we hope to provide the audience with layout examples that may relate more to real-life cases when developing an app, which may help the audience understand more about the behaviours of various `LayoutSpecs` and how to achieve a specific layout by combining them.

#### Exercise

The goal of the exercises in this session is for the audience to re-create the layout provided in the example (`top-right button in navigation bar of every Exercise page`), all the elements (`nodes`) are provided

- Exercise 1 - Learn how to create the layout using a combination of `ASStackLayoutSpec` and `ASInsetLayoutSpec`
- Exercise 2 - Edit the layout from `Exercise 1` by adding `ASBackgroundLayoutSpec` to the layout
- Exercise 3 - Learn how to create a reusable custom node of `ASDisplayNode` type and achieve the same result as `Exercise 2`, but only instantiating `CustomNode` instead of a bunch of elements in the `ViewController`

#### Notes

- Cheats for `Exercise 1`, `Exercise 2`, and `Exercise 3` are provided under `Session 2 - InteractiveUI/Components/Cheats`
- It is recommended that the audience do not look at the cheats until the exercises are complete or they are completely stuck
