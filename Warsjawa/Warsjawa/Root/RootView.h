#import <Foundation/Foundation.h>


@interface RootView : UIView

@property (nonatomic, strong) UIView *menuView;

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, readonly) BOOL open;

- (void)openMenu;
- (void)closeMenu;

@end
