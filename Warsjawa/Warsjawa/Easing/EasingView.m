#import "EasingView.h"
#import "EasingAnimation.h"


@interface EasingView ()
@property(nonatomic, strong) UIView *rectangleView;
@property(nonatomic, strong) CADisplayLink *displayLink;
@property(nonatomic, strong) NSMutableArray *animations;
@end

@implementation EasingView {

}

- (instancetype)init {
    self = [super init];
    if (self) {
        self.backgroundColor = [UIColor grayColor];
        
        self.rectangleView = [[UIView alloc] init];
        self.rectangleView.backgroundColor = [UIColor redColor];
        [self addSubview:self.rectangleView];

        self.displayLink = [[UIScreen mainScreen] displayLinkWithTarget:self selector:@selector(animationTick:)];
        self.displayLink.paused = YES;
        [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
        
        self.animations = [NSMutableArray array];
    }

    return self;
}

- (void)animationTick:(CADisplayLink *)displayLink {
    CFTimeInterval dt = displayLink.duration;
    for (EasingAnimation *a in [self.animations copy]) {
        BOOL finished = NO;
        [a animationTick:dt finished:&finished];
        if (finished) {
            [self.animations removeObject:a];
        }
    }
    if (self.animations.count == 0) {
        self.displayLink.paused = YES;
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.rectangleView.frame = CGRectMake(0, 0, 100, 100);
    self.rectangleView.center = CGPointMake(self.center.x, self.center.y);
}

- (void)animateLeft {
    EasingAnimation *animation = [[EasingAnimation alloc] initWithView:self.rectangleView targetCenterPoint:CGPointMake(self.rectangleView.frame.size.width * 0.5f, self.rectangleView.center.y) animationTime:1.f];
    [self.animations addObject:animation];

    self.displayLink.paused = NO;
}

- (void)animateRight {
    EasingAnimation *animation = [[EasingAnimation alloc] initWithView:self.rectangleView targetCenterPoint:CGPointMake(self.bounds.size.width - self.rectangleView.frame.size.width * 0.5f, self.rectangleView.center.y) animationTime:1.f];
    [self.animations addObject:animation];

    self.displayLink.paused = NO;
}

@end
