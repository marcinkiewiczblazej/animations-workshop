#import "EasingAnimation.h"


@interface EasingAnimation ()
@property(nonatomic) float remainingTime;
@property(nonatomic, strong) UIView *view;
@property(nonatomic) CGPoint targetPoint;
@property(nonatomic) float totalTime;
@property(nonatomic) CGPoint initialPoint;
@end

@implementation EasingAnimation {

}

- (instancetype)initWithView:(UIView *)view targetCenterPoint:(CGPoint)targetPoint animationTime:(float)time {
    self = [self init];
    if (self) {
        self.remainingTime = time;
        self.totalTime = time;
        self.view = view;
        self.targetPoint = targetPoint;
        self.initialPoint = view.center;
    }
    return self;
}

- (void)animationTick:(CFTimeInterval)dt finished:(BOOL *)finished {
    float time = self.totalTime - self.remainingTime;
    time /= self.totalTime;
    float value = 0;
    float magnitude = 9.5625f;
    float duration = 2.75f;
    if (time < 1 / duration) {
   		value = magnitude * time * time;
   	} else if (time < 2 / duration) {
   		time -= (1.5f/ duration);
   		value = magnitude * time * time + .75f;
   	} else if (time < 2.5/ duration) {
        time -= (2.25f / duration);
   		value = magnitude * time * time + .9375f;
   	} else {
   		time -= (2.625f/ duration);
   		value = magnitude * time * time + .984375f;
   	}

    self.remainingTime -= dt;
    if (self.remainingTime < 0) {
        *finished = YES;
    }
    CGPoint currentPosition = CGPointMake(value * (self.targetPoint.x - self.initialPoint.x) + self.initialPoint.x,
            value * (self.targetPoint.y - self.initialPoint.y) +  + self.initialPoint.y);
    self.view.center = currentPosition;
}

@end
