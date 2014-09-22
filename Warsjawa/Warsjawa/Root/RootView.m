#import "RootView.h"


@interface RootView ()
@property (nonatomic) BOOL open;
@end

@implementation RootView {

}

- (instancetype)init {
    self = [super init];
    if (self) {

    }

    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat menuWidth = 200;

    self.menuView.frame = CGRectMake(0, 0, menuWidth, self.bounds.size.height);
    self.contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
}

- (void)openMenu {
    self.open = YES;
    self.menuView.hidden = NO;

    CATransform3D endMatrix = CATransform3DIdentity;
    // Perspective
    endMatrix.m34 = -0.002f;
    CGFloat angle = -M_PI_2;
    CGFloat xAxis = 0;
    CGFloat yAxis = 1;

    CGPoint center = self.menuView.center;
    self.menuView.layer.anchorPoint = CGPointMake(0.f, 0.5);
    self.menuView.center = CGPointMake(0, center.y);

    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.keyPath = @"transform";
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DRotate(endMatrix, angle, xAxis, yAxis, 0) ];
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.duration = 0.5f;

    [self.menuView.layer addAnimation:animation forKey:@"key-value"];
}


- (void)closeMenu {
    self.open = NO;

    CATransform3D endMatrix = CATransform3DIdentity;
    // Perspective
    endMatrix.m34 = -0.002f;
    CGFloat angle = -M_PI_2;
    CGFloat xAxis = 0;
    CGFloat yAxis = 1;

    self.menuView.layer.anchorPoint = CGPointMake(0.f, 0.5);

    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.delegate = self;
    animation.keyPath = @"transform";
    animation.toValue = [NSValue valueWithCATransform3D:CATransform3DRotate(endMatrix, angle, xAxis, yAxis, 0) ];
    animation.fromValue = [NSValue valueWithCATransform3D:CATransform3DIdentity];
    animation.duration = 0.5f;

    [self.menuView.layer addAnimation:animation forKey:@"key-value"];

}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    self.menuView.hidden = YES;
}


- (void)setMenuView:(UIView *)menuView {
    [_menuView removeFromSuperview];
    _menuView = menuView;
    [self addSubview:_menuView];

    _menuView.hidden = !self.open;
}

- (void)setContentView:(UIView *)contentView {
    [_contentView removeFromSuperview];
    _contentView = contentView;
    [self addSubview:_contentView];

    [self bringSubviewToFront:_menuView];
}


@end
