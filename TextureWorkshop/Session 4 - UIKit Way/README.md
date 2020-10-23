#  Session 4 - Usage Comparison with UIKit

In this session, we will compare with the usage of UIKit for the same UI component, which is `Wish List Product Card`, from the implementation and performance perspective.


## Code Implementation

In UIKit, we usually use `Auto Layout` and managing `Constraints` to dynamically calculate the size and position of all the views. Sometimes it can be cumbersome to manage the `Constraints` if we had a lot of UI components, and these components need to be optionally placed on the view hierarchy. In this example, we use `Constraints` to manage UI components' size and position.


#### 1. Open folder group named `Session 4 - UIKit Way`

We already created an example of UIKit implementation for `Wish List Product Card`. The view itself located in the `InterfaceBuilder` folder group, and we use `XIB` to construct it. Also, we had created a separated sub-component for the `Rating View` in the `Components` folder group to make it easy to manage.


#### 2. Look into ProductCardWishlistTableViewCell.xib implementation

Next, open the `ProductCardWishlistTableViewCell.xib` file. We declared this UI component as `UITableViewCell` because we want to put it on `UITableView`. If you dig deeper into the child-views, you can see these components heavily-dependent on `Constraints` to manage its size and position.

With implementation like this, how to hide the `view components` that not need to be shown in a certain condition? To achieve that, usually, we can manage `Constraints` by:

- Managing it's `constant` property
- Managing it's `isActive` state


#### 3. Open ProductCardWishlistTableViewCell.swift implementation

In this file, we already implement the code for us. We see that we have `Constraint Outlets` section. We will heavily depend on that.


#### 4. Managing Shop Badge Image

In the current implementation, to change the `Shop Badge` image, we can change the `shopBadgeImage.image` property to the preferred image. But for managing the hidden state, we still only change the `shopBadgeImage.isHidden` property. If you run this code, this implementation only hiding the view itself and leaving blank space on it. 

![Shop Badge Issue](https://i.postimg.cc/j26zvXyF/shop-badge.png)

But, if we want to hide the view and also remove the blank space, how to do that?

In the `refreshUi()` method, you can see the switch case section for `shop type`. In each case, you can try to enable: `showShopBadge(with:)` or `hideShopBadge()` code and make the rest disabled by commenting them out. After that, let's try to run it.

![Shop Badge Issue Fixed](https://i.postimg.cc/sDyPxkrd/shop-badge-fixed.png)

You can see, the new implementation can make the `Shop Badge` image hidden and eliminate the blank space. If you see the `showShopBadge(with:)` and `hideShopBadge()` code, we managing `constant` property of `shopBadgeWidthConstraint` and `shopBadgeGap` Constraints to hide the blank space.

By this implementation, the sizing can be wrong, which can be caused by human error if we need to change the view size in the `XIB` but we forget to change in the `.swift` too. This error can be minimized if we implementing full UI implementation programmatically without using `XIB`.


#### 5. Managing Rating and "Bebas Ongkir" View State

If we see the `Managing Shop Badge Image` implementation, the implementation looks simple. But it can be otherwise if we need to handle multiple `Views'` state.

We have already run the previous implementation. If we look at the screen, we can see there's blank space too while hiding the `Rating` and `Bebas Ongkir` view. 

![Rating and Free Shipping Issue](https://i.postimg.cc/ry5C887N/rating-freeshipping.png)

To fix that we can see in the `ProductCardWishlistTableViewCell.swift` file, on the `refreshUI()` method, there's a section called `#2 Extra Cases: Hiding both rating bar and free shipping`.

Below that section, we need to disable the codes that have commented on it by comment it out. Also, we need to enable other codes below of previous code, which has commented on it too, by uncommenting it. Try to run the code.

![Rating and Free Shipping Issue](https://i.postimg.cc/650rvMW7/rating-freeshipping-fixed.png)

As we can see, now the UI can be shown properly by removing blanks space if the `Rating` and/or `Free Shipping` image was hidden. If you see the codes that you enable by uncommenting-out before, we heavily managing the `Constraints` state there. We need to turn-off the un-needed `Constraints` first and enable what we need. If you wrongly manage it, the `Constraints` can be broken and the UI can be glitched because the `OS` will attempt to fix that broken `Constraints` and sometimes it fixed in the wrong way.

Imagine if we had many `View components` that need to be dynamically shown based on a certain state.


#### 6. UIStackView

In some years ago, Apple introduced `UIStackView` that we can use to easily manage the `View components` state. If we hide a `view` in the stack, `UIStackView` will automatically manage for removing blank space of that `view`.

But in some conditions, it can be painful to control `UIStackView` if we had deep-nested `UIStackView` and some `child-view` have a different size than the other. Also for spacing between each element, it should be of the same size. For handling that, usually we need to use dummy `UIView` that acts as `spacer`. 


## Performance

As we know, `Texture` has the benefit of its `UI Calculation` because it is done in the background thread, contrary to `UIKit` that the calculation is done in the main thread.

We already made a video showing the performance of both, that shown in `FPS` metrics. In that video, we showing the implementation of `iPhone 5` with `iOS 9`. In that video, it clearly shows that `UIKit` implementation have performance drop. It has an average of 30++ fps compared to `Texture` that has an average of 50++ fps.

###### UIKit Implementation
![Pure UIKit Implementation FPS Metrics](https://i.postimg.cc/j2TfW7BQ/pure-uikit-fps.png)

###### Texture Implementation
![Texture Implementation FPS Metrics](https://i.postimg.cc/7Lp0kcVR/texture-fps.png)

We can improve the `UIKit` implementation by implementing `shadowPath` for showing the shadow. Also, we already made a video showing the performance while using `shadowPath`. The `FPS` increased to average 40++ fps, but still can't on par with `Texture`.

###### UIKit with shadowPath Implementation
![UIKit with shadowPath Implementation FPS Metrics](https://i.postimg.cc/SsC8Nr1x/shadow-Path-uikit-fps.png)

###### Supplementary Files Link - Performance Demo Video
https://bit.ly/twOct2020Supplementary
