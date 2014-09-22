#import "ProgressViewController.h"
#import "ProgressView.h"
#import "ProgressLayer.h"

static NSString *const reuseIdentifier = @"reuseIdentifier";

@interface ProgressViewController ()
@end

@implementation ProgressViewController {

}

- (void)loadView {
    [super loadView];

    self.view = [[ProgressView alloc] init];
}

- (ProgressView *)progressView {
    if (self.isViewLoaded) {
        return (ProgressView *) self.view;
    }
    return nil;
}

- (void)updateProgress {
    self.progressView.ratingLayer.progressValue = arc4random_uniform(1024);
    [self performSelector:@selector(updateProgress) withObject:nil afterDelay:5.f];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];

    [NSObject cancelPreviousPerformRequestsWithTarget:self];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self updateProgress];
}


@end
