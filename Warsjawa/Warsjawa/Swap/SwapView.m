#import "SwapView.h"


@interface SwapView ()
@property(nonatomic, strong) UIImageView *beachImageView;
@property(nonatomic, strong) UIImageView *sunImageView;
@end

@implementation SwapView {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.beachImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"beach-425167_640.jpg"]];
        [self addSubview:self.beachImageView];
        
        self.sunImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"the-sun-430992_640.jpg"]];
        [self addSubview:self.sunImageView];
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    int imageWidth = 150;
    CGSize imageSize = CGSizeMake(imageWidth, 0.65625f * imageWidth);

    self.beachImageView.frame = CGRectMake((self.bounds.size.width - imageSize.width) * 0.5f, (self.bounds.size.height - imageSize.height) * 0.5f,
            imageSize.width, imageSize.height);

    self.sunImageView.frame = CGRectMake((self.bounds.size.width - imageSize.width) * 0.5f, (self.bounds.size.height - imageSize.height) * 0.5f,
            imageSize.width, imageSize.height);
}

- (void)startAnimating {
    [UIView animateKeyframesWithDuration:3.0f delay:0.f options:UIViewKeyframeAnimationOptionRepeat | UIViewKeyframeAnimationOptionCalculationModeCubic animations:^{
        self.beachImageView.transform = CGAffineTransformIdentity;
        self.sunImageView.transform = CGAffineTransformIdentity;

        [UIView addKeyframeWithRelativeStartTime:0.f relativeDuration:0.5f animations:^{
            CGFloat angle = 0.10f;

            CGFloat yOffset = 20.f;
            CGFloat xOffset = 90.f;

            self.beachImageView.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(xOffset, -yOffset), CGAffineTransformMakeRotation(angle));
            self.sunImageView.transform = CGAffineTransformConcat(CGAffineTransformMakeTranslation(-xOffset, 0), CGAffineTransformMakeRotation(-angle));
        }];

        [UIView addKeyframeWithRelativeStartTime:0.5f relativeDuration:0.5f animations:^{

            self.beachImageView.transform = CGAffineTransformIdentity;
            self.sunImageView.transform = CGAffineTransformIdentity;
        }];
    } completion:nil];
}


@end
