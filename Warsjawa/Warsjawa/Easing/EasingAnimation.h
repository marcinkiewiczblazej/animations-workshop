#import <Foundation/Foundation.h>


@interface EasingAnimation : NSObject

- (instancetype)initWithView:(UIView *)view targetCenterPoint:(CGPoint)targetPoint animationTime:(float)time;

- (void)animationTick:(CFTimeInterval)dt finished:(BOOL *)finished;

@end
