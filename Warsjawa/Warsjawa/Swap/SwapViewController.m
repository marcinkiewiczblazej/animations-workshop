
#import "SwapViewController.h"
#import "SwapView.h"


@interface SwapViewController ()

@end

@implementation SwapViewController

- (void)loadView {
    [super loadView];

    SwapView *swapView = [[SwapView alloc] init];
    self.view = swapView;
}

- (SwapView *)swapView {
    if (self.isViewLoaded) {
        return (SwapView *) self.view;
    }
    return nil;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [[self swapView] startAnimating];
}

@end
