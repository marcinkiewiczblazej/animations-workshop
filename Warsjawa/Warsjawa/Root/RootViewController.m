#import "RootViewController.h"
#import "MenuViewController.h"
#import "RootView.h"
#import "SwapViewController.h"
#import "RefreshViewController.h"
#import "ProgressViewController.h"
#import "EasingViewController.h"


@interface RootViewController ()
@property(nonatomic, strong) MenuViewController *menuViewController;
@property(nonatomic, strong) UINavigationController *contentViewController;
@end

@implementation RootViewController {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.menuViewController = [[MenuViewController alloc] initWithNibName:nil bundle:nil];
        self.menuViewController.menuViewControllerDelegate = self;

        self.contentViewController = [[UINavigationController alloc] init];
    }

    return self;
}

- (void)toggleSideMenu {
    if (self.rootView.open) {
        [self.rootView closeMenu];
    } else {
        [self.rootView openMenu];
    }
}

- (void)loadView {
    [super loadView];

    RootView *rootView = [[RootView alloc] init];
    rootView.menuView = self.menuViewController.view;
    SwapViewController *swapViewController = [[SwapViewController alloc] init];
    swapViewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(toggleSideMenu)];
    [self.contentViewController setViewControllers:@[swapViewController] animated:NO];
    rootView.contentView = self.contentViewController.view;
    self.view = rootView;
}

- (void)viewWillLayoutSubviews {
    [super viewWillLayoutSubviews];
    self.menuViewController.tableView.contentInset = UIEdgeInsetsMake(self.topLayoutGuide.length, 0, 0, 0);
}


- (RootView *)rootView {
    if (self.isViewLoaded) {
        return (RootView *) self.view;
    }
    return nil;
}

- (void)menuViewController:(MenuViewController *)menuViewController didSelectOption:(NSUInteger)option {
    UIViewController *controller;
    switch (option) {
        case 0:
            controller = [[SwapViewController alloc] init];
            break;
        case 1:
            controller = [[RefreshViewController alloc] init];
            break;
        case 2:
            controller = [[ProgressViewController alloc] init];
            break;
        case 3:
            controller = [[EasingViewController alloc] init];
            break;
        default:
            controller = nil;
            break;
    }

    if (controller) {
        controller.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(toggleSideMenu)];
        [self.contentViewController setViewControllers:@[controller] animated:YES];
    }
    [self toggleSideMenu];
}


@end
