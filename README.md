##iOS_viewcontroller
###**1.View Controller Responsibilities**
A view controller’s most important responsibility is its view.
A view controller will typically provide **animation** of the interface as a view comes or goes.

View controllers, working together, can save and restore **state** automatically.
 

The most powerful view controller is the **root view controller**

---

### 2. View Controller Hierarchy
In iOS, there are **two subordination relationships** between view controllers

1. **Parentage (containment)**

    A view controller can contain another view controller. The containing view con‐ troller is the parent of the contained view controller;

    the child view controller’s view, if it is in the interface at all, is a subview (at some depth) of the parent view controller’s view.

2. **Presentation (modal views)**

    A view controller can present another view controller. The first view controller is the **presenting view controller** (not the parent) of the second; the second view controller is the **presented view controller** (not a child) of the first.
    The second view controller’s view **replaces or covers,** completely or partially, the first view controller’s view.

Moreover, there is a **clear relationship** between the **view hierarchy** and the view conroller hierarchy

The place of a view controller’s view in the view hierarchy will often be automatic. You might never need to put a UIViewController’s view into the view hierarchy manually.

----

###3. View Controller Creation
A view controller is an instance like any other instance, and it is created like any other instance — **by instantiating its class**.

Alternatively, a view controller instance might come into existence through the loading of a nib.

A view controller in a storyboard will **go into a nib file** in the built app
Nevertheless, a view controller in a storyboard is an ordinary nib object and, if it is to be used in the running app, will be instantiated through the loading of the nib **just like any other nib object.**

---
###4. How a View Controller Gets Its View
Initially, when it first comes into existence, a view controller **has no view**. A view controller is a small, **lightweight** object; a view is a relatively **heavyweight** object, involving interface elements that **occupy memory**. Therefore, a view controller **postpones** obtaining its view until it has to do so, namely, when it is asked for the value of its view property.

To learn whether a view controller has a view without causing it to load its view, call **isViewLoaded**

. New in iOS 9, you can refer to a view controller’s view safely, without loading it, as its **viewIfLoaded** (an Optional)

As soon as a view controller has its view, its **viewDidLoad** method is called.

Bear in mind, however, that the view may **not yet be part of the interface**! In fact, it almost certainly is not

Performing certain **customizations** prematurely in viewDidLoad is a common beginner **mistake**.

• The view may be created in the view controller’s own code, **manually**.
• The view may be created as an **empty generic view, automatically**.
• The view may be created in its own separate **nib**.
• The view may be created in a nib, which is **the same nib from which the view controller itself is instantiated.**

---
####Manual View
To supply a UIViewController’s view manually, in code, implement its **loadView** method.

----
####Generic Automatic View

----
####View in a Separate Nib
• **The File’s Owner class** must be set to a UIViewController subclass (depending on the class of the view controller whose view this will be).

• **The File’s Owner proxy** now has a view outlet, corresponding to a UIView‐ Controller’s view property. This outlet must be connected to the view.
` let theRVC = RootViewController(nibName:"MyNib", bundle:nil)`

it turns out that if the nib name passed to **init(nibName:bundle:) is nil,** a nib will be sought automatically with the same name as the view controller’s class. Moreover, **UIViewController’s init() calls init(nibName:bundle:), passing nil for both arguments**

Thus, we can name our nib file **RootView.xib** instead of **RootViewController.xib**, and it will still be properly associated with our RootViewController instance.

1. When the view controller first decides that it needs its view, **loadView** is always called.

2. If we override loadView, we supply and set the view in code, and we do not call super. Therefore the process of seeking a view comes to an end.

3. If we don’t override loadView, UIViewController’s built-in **default implementation of loadView** is used. It is this default implementation of loadView that** loads the view controller’s associated nib**. That is why, if we do override loadView, we must not call super — that would cause us to get both behaviors!

4. If the previous steps all fail — we don’t override loadView, and there is no associated nib — UIViewController’s **default implementation of loadView creates a generic UIView.**

----
####Nib-Instantiated View Controller
```
let arr = UINib(nibName: "Main", bundle: nil) .instantiateWithOwner(nil, options: nil) 
self.window!.rootViewController = arr[0] as? UIViewController
```

When a view controller is instantiated from a nib, your implementation of its init(nibName:bundle:) initializer is not called. If your nib-instantiated UIView‐ Controller subclass needs access to the view controller instance very early in its lifetime, override init(coder:) or **awakeFromNib**.

----
####Storyboard-Instantiated View Controller
Each scene in a .storyboard file is rather like a .xib file containing a **view controller nib object.**

A scene’s view controller is instantiated only **when needed**; the underlying mechanism is that the scene’s view controller is stored in a nib file in the built app, inside the .storyboardc bundle, and **this nib file is loaded on demand and the view controller is instantiated from it**, as we did in the previous section.

----
###5. View Resizing
####View Size in the Nib Editor
When you design your interface in the nib editor, every view controller’s view has to be displayed at some definite size. But that size may not be the size at which the view will appear at runtime.

----
####Bars and Underlapping
**The status bar is underlapped**

**Top and bottom bars may be underlapped**

The top and bottom bars displayed by a navigation controller (navigation bar, tool‐ bar) or tab bar controller (tab bar) can be translucent. When they are, your view controller’s view is, by default, **extended behind the translucent bar**
The status bar may be present or absent. Top and bottom bars may be present or absent, and, if present, their height can change. How will your interface **cope with such changes**? The primary coping mechanism is the view controller’s **layout guides**.

1. **topLayoutGuide**

	• If there is a status bar and no top bar, the topLayoutGuide is positioned at the bottom of the status bar.

	• If there is a top bar, the topLayoutGuide is positioned at the bottom of the top bar.

	• If there is no top bar and no status bar, the topLayoutGuide is positioned at the top of the view.

2. **bottomLayoutGuide**

	• If there is a bottom bar, the bottomLayoutGuide is positioned at the top of the bottom bar.

	• If there is no bottom bar, the bottomLayoutGuide is positioned at the bottom of the view.

**Status bar visibility**

- preferredStatusBarStyle
- prefersStatusBarHidden
- childViewControllerForStatusBarStyle
- childViewControllerForStatusBarHidden

```
override var preferredStatusBarStyle: UIStatusBarStyle{
   return .lightContent
}
override var prefersStatusBarHidden: Bool
   {
       return self.hide
}
override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation
   {
       return .fade
}
```
    
```
@IBAction func doButton(_ sender: Any) {
   self.hide = !self.hide
   UIView.animate(withDuration: 1, animations: {
       self.setNeedsStatusBarAppearanceUpdate()
       self.view.layoutIfNeeded()
   })
}
```

**Extended layout**

- edgesForExtendedLayout

 A UIRectEdge. The default is .All, meaning that this view controller’s view will underlap a translucent top bar or a translucent bottom bar. The other extreme is .None, meaning that this view controller’s view won’t underlap top and bottom bars. Other possibilities are .Top (underlap translucent top bars only) and .Bottom (underlap translucent bottom bars only).
 
- extendedLayoutIncludesOpaqueBars

If true, then if edgesForExtendedLayout permits underlapping of bars, those bars will be underlapped even if they are opaque. The default is false, meaning that only translucent bars are underlapped.

----
####Resizing Events
•willTransitionToTraitCollection:withTransitionCoordinator:

Sent when the app is about to undergo a change in the trait collection (because the size classes will change).

•viewWillTransitionToSize:withTransitionCoordinator:

Sent when the app is about to undergo rotation (even if the rotation turns out to be 180 degrees and the size won’t actually change) or an iPad multitasking size change.

• updateViewConstraints
• traitCollectionDidChange:
• viewWillLayoutSubviews
• viewDidLayoutSubviews

```
override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
   
}
override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
   
}
override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
   
}
override func viewWillLayoutSubviews() {
   
}
override func viewDidLayoutSubviews() {

}
```

----
####**Rotation**
Rotation expresses itself in two ways:

1. The status bar orientation changes

    ```
    func application(_ application: UIApplication, willChangeStatusBarOrientation newStatusBarOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        
    }
    func application(_ application: UIApplication, didChangeStatusBarOrientation oldStatusBarOrientation: UIInterfaceOrientation) {
        
    }
    ```

2. The view controller’s view is resized

----

###6. Presented View Controller
####**Presenting a View**
1. Presented view controller
	The view controller specified as Controller:animated:completion:.
	
2. Original presenter
	The view controller to which presentViewController:animated:completion: was sent.
	
3. Presenting view controller
	The presented view controller’s presentingViewController. This is the view con‐ troller whose view is replaced or covered by the presented view controller’s view.
	
Thus, the presented view controller might be thepresentedViewController of two different view controllers
**A view controller can have at most one presentedViewController**. If you send presentViewController:animated:completion: to a view controller whose presentedViewController isn’t nil, **nothing will happen and the completion handler is not called** (and you’ll get a warning from the runtime).

However, a presented view controller can itself present a view controller, so there can be a chain of presented view controllers. If you send dismissViewControllerAnimated:completion: to a view controller in the middle of a presentation chain — a view controller that has both a presentingViewController and a presentedView- Controller — then its presentedViewController is dismissed.

If you send dismissViewControllerAnimated:completion: to a view controller **whose presentedViewController is nil **and that has no presentingViewController, noth ing will happen (not even a warning in the console), and the completion: handler is not called.

----
####**Presented View Animation**
There are a few different built-in animation styles (**modal transition styles**) to choose from.

```
public enum UIModalTransitionStyle : Int {

    
    case coverVertical

    case flipHorizontal

    case crossDissolve

    @available(iOS 3.2, *)
    case partialCurl
}
```

it is attached beforehand to a presented view controller as its **modalTransitionStyle** property

```
let controler = PresentedController()
if indexPath.row == 0 {
  controler.modalTransitionStyle = .coverVertical
}
else if indexPath.row == 1{
  controler.modalTransitionStyle = .flipHorizontal
}
else if indexPath.row == 2{
  controler.modalTransitionStyle = .crossDissolve
}
else if indexPath.row == 3{
  controler.modalTransitionStyle = .partialCurl
}
self.present(controler, animated: true, completion: nil)
```

----
####Presentation Styles
By default, the presented view controller’s view occupies the entire screen, completely replacing that of the presenting view controller. But you can choose from a few other built-in options expressing **how the presented view controller’s view should cover the screen** (**modal presentation styles**).

To choose a presentation style, set the presented view controller’s **modalPresentationStyle** property.

```
public enum UIModalPresentationStyle : Int {

    
    case fullScreen

    @available(iOS 3.2, *)
    case pageSheet

    @available(iOS 3.2, *)
    case formSheet

    @available(iOS 3.2, *)
    case currentContext

    @available(iOS 7.0, *)
    case custom

    @available(iOS 8.0, *)
    case overFullScreen

    @available(iOS 8.0, *)
    case overCurrentContext

    @available(iOS 8.0, *)
    case popover

    @available(iOS 7.0, *)
    case none
}
```

----
###**7. Tab Bar Controller**
A tab bar is an **independent** interface object, but it is most commonly used in conjunction with a tab bar controller

You can get a reference to the tab bar controller’s tab bar through its **tabBar** property.

If a tab bar controller is the top-level view controller, it determines your app’s **compensatory rotation** behavior.
• tabBarControllerSupportedInterfaceOrientations:
• tabBarControllerPreferredInterfaceOrientationForPresentation:

----

####Tab Bar Items
There are two ways to make a tab bar item

1. By borrowing it from the system

    Instantiate UITabBarItem using **init(tabBarSystemItem:tag:)**, and assign the instance to your child view controller’s tabBarItem
2. By making your own

    Instantiate UITabBarItem using **init(title:image:tag:)** and assign the instance to your child view controller’s tabBarItem. Alternatively, use the view controller’s existing tabBarItem and set its image and title. Instead of setting the title of the tabBarItem, you can set the **title property of the view controller **itself; doing this automatically sets the title of its current tabBarItem (unless the tab bar item is a system tab bar item), though the converse is not true.
You can add a separate selectedImage later, or possibly by initializing with **init(title:image:selectedImage:).**

The image (and selectedImage) for a tab bar item should be a 30×30 PNG;

You can also give a tab bar item a **badge** (see the documentation on the badgeValue property).

----

####Configuring a Tab Bar Controller

----

###8. Custom Transition
You can** customize the transition** that occurs between view controller views, as follows

• When a **tab bar controller** changes which of its child view controllers is selected, you can animate the change of views.

• When a **navigation controller pushes or pops** a child view controller, you can customize the animation of views.

• When a view controller is **presented or dismissed**, you can customize the animation of views and the placement of the presented view.

----

###9. Container View Controllers
UITabBarController, UINavigationController, and UIPageViewController are built-in parent view controllers: you hand them a child view controller and they **put that child view controller’s view into the interface for you**, inside their own view. What if you want your **own view controller **to do the same thing?

A custom parent view controller of this sort is called a **container view controller**.

----
####Adding and Removing Children
A view controller has a **childViewControllers** array.

```
firstViewController=[[FirstViewController alloc] initWithNibName:@"FirstViewController" bundle:nil];
[self addChildViewController:firstViewController];

secondViewController=[[SecondViewController alloc] initWithNibName:@"SecondViewController" bundle:nil];
[self addChildViewController:secondViewController];

thirdViewController=[[ThirdViewController alloc] initWithNibName:@"ThirdViewController" bundle:nil];
[self addChildViewController:thirdViewController];

[contentView addSubview:thirdViewController.view];
    
[secondViewController removeFromParentViewController];
currentViewController=thirdViewController;
```

The next question is how to replace one child view controller’s view in the interface with another 

```
  [self transitionFromViewController:currentViewController toViewController:secondViewController duration:1 options:UIViewAnimationOptionTransitionCurlDown animations:^{

  }  completion:^(BOOL finished) {
      if (finished) {
        currentViewController=secondViewController;
      }else{
          currentViewController=oldViewController;
      }
  }];
```
----
###9. View Controller Lifetime Events
```
override func willMove(toParentViewController parent: UIViewController?) {
   print("will move ")
}
override func viewWillAppear(_ animated: Bool) {
   print("view will appear")
}
override func updateViewConstraints() {
   print("updateViewConstraints")
}
override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
   print("traitCollectionDidChange")
}
override func viewWillLayoutSubviews() {
   print("viewWillLayoutSubviews")
}
override func viewDidLayoutSubviews() {
   print("viewDidLayoutSubviews")
}
override func viewDidAppear(_ animated: Bool) {
   print("viewDidAppear")
}
override func didMove(toParentViewController parent: UIViewController?) {
   print("didMoveToParentViewController")
}
```

