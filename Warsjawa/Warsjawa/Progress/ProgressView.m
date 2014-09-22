#import "ProgressView.h"
#import "ProgressLayer.h"


@interface ProgressView ()
@property(nonatomic, strong) ProgressLayer *ratingLayer;
@end

@implementation ProgressView {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];

        self.ratingLayer = [ProgressLayer layer];
        [self.layer addSublayer:self.ratingLayer];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGSize frameSize = CGSizeMake(200, 50);
    self.ratingLayer.frame = CGRectMake((self.bounds.size.width - frameSize.width) * 0.5f, (self.bounds.size.height - frameSize.height) * 0.5f,
            frameSize.width, frameSize.height);
}

@end
