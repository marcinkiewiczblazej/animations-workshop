#import <Foundation/Foundation.h>

@class MenuViewController;

@protocol MenuViewControllerDelegate
- (void)menuViewController:(MenuViewController *)menuViewController didSelectOption:(NSUInteger)option;
@end

@interface MenuViewController : UITableViewController
@property (nonatomic, weak) id<MenuViewControllerDelegate> menuViewControllerDelegate;
@end
