#import "EasingViewController.h"
#import "EasingView.h"

typedef enum {
    Left,
    Right
} Direction;

@interface EasingViewController ()
@property(nonatomic) Direction direction;
@end

@implementation EasingViewController {

}

- (void)loadView {
    [super loadView];

    self.view = [[EasingView alloc] init];
    self.direction = Left;
}

- (EasingView *)easingView {
    if (self.isViewLoaded) {
        return (EasingView *) self.view;
    }
    return nil;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    [self animate];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)animate {
    if (self.direction == Left) {
        self.direction = Right;
        [self.easingView animateRight];
    } else {
        self.direction = Left;
        [self.easingView animateLeft];
    }

    [self performSelector:@selector(animate) withObject:nil afterDelay:5];
}

@end
