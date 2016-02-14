# AJRNight
Lightweight iOS framework for adding night mode to projects


----------
#Installation

 - Using **CocoaPods** just add this to your podfile:

> pod 'AJRNight'

 - Manual Installation:
 
> Clone project and add the files in the AJRNight directory to your project



----------
#Usage
AJRNight is very lightweight, flexible, and simple to use. In essence what happens behind the scenes is that we add a category to `UIView` with a dictionary `nightProperties`. This holds all the properties that need to change for night mode (`backgroundColor`, `textColor,` etc.)

As an example:
>self.view.nightProperties = @{@"backgroundColor": [UIColor blackColor]

 1. Add the following line to any view controller which needs night mode:
> \#import \<AJRNight/AJRNight.h\>

 2. Add the `AJRNightDelegate` delegate to your view controller:
> @interface PreferencesViewController : UIViewController \<AJRNightDelegate\>

 3. Add the following in your viewDidLoad:
> [[AJRNight sharedClient] addViewController:self];

 4. Edit the `nightProperties` for any `UIView` that needs to change.
 	- 	Note: setting nightProperties through `appearance`(`[[UILabel appearance] setNightProperties:@{}]`) is supported on most, but not all, UIViews
	>	self.view.nightProperties = @{
	>                                  @"backgroundColor": [UIColor blackColor]
	>                                  };

	>	[[UILabel appearance] setNightProperties:@{
	>                                               @"textColor": [UIColor whiteColor]
	>                                               }];

When you want to switch to night mode, simply call ` [[AJRNight sharedClient] setNightMode:YES];`

An example project is included with more details.

For more advanced night/day conversion animations you should implement the `- (void)goodMorning` and `- (void)goodNight` `AJRNightDelegate` methods. This is useful for layer animations as well as navigation/tab controller animations. 


