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
    CGFloat duration = 3.f;
    CGFloat angle = 0.10f;

    CGFloat yOffset = -20.f;
    CGFloat xOffset = 90.f;

    CAAnimationGroup *sunGroupAnimation = [self animationForDuration:duration angle:angle center:self.sunImageView.center offset:CGPointMake(xOffset, yOffset) multiplier:1];
    CAAnimationGroup *beachGroupAnimation = [self animationForDuration:duration angle:angle center:self.beachImageView.center offset:CGPointMake(xOffset, yOffset) multiplier:-1];

    [self.beachImageView.layer addAnimation:beachGroupAnimation forKey:@"swap"];
    [self.sunImageView.layer addAnimation:sunGroupAnimation forKey:@"swap"];
}

- (CAAnimationGroup *)animationForDuration:(CGFloat)duration angle:(CGFloat)angle center:(CGPoint)center offset:(CGPoint)offset multiplier:(int)multiplier {
    CABasicAnimation *zPositionAnimation = [CABasicAnimation animation];
    zPositionAnimation.keyPath = @"zPosition";
    zPositionAnimation.fromValue = @(-1 * multiplier);
    zPositionAnimation.toValue = @(1 * multiplier);
    zPositionAnimation.duration = duration;

    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animation];
    positionAnimation.keyPath = @"position";
    positionAnimation.duration = duration;
    positionAnimation.values = @[[NSValue valueWithCGPoint:center], [NSValue valueWithCGPoint:CGPointMake(offset.x * multiplier + center.x, offset.y * multiplier + center.y)], [NSValue valueWithCGPoint:center]];
    positionAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];

    CAKeyframeAnimation *rotationAnimation = [CAKeyframeAnimation animation];
    rotationAnimation.keyPath = @"transform.rotation";
    rotationAnimation.duration = duration;
    rotationAnimation.values = @[@0, @(angle * multiplier), @0];
    rotationAnimation.timingFunctions = @[[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut], [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];

    CAAnimationGroup *group = [[CAAnimationGroup alloc] init];
    group.animations = @[zPositionAnimation, rotationAnimation, positionAnimation];
    group.duration = duration;
    group.repeatCount = HUGE_VALF;

    return group;
}


@end
