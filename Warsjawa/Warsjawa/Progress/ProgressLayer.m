#import "ProgressLayer.h"


@interface ProgressLayer ()
@end

@implementation ProgressLayer {

}

@dynamic progressValue;

- (void)display {
    [super display];

    //create drawing context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);

    NSString *valueString = [NSString stringWithFormat:@"%@", @([self.presentationLayer progressValue])];

    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];

    [valueString drawInRect:self.bounds withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:40], NSParagraphStyleAttributeName : style}];
    //set backing image
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}

- (id <CAAction>)actionForKey:(NSString *)event {
    if ([event isEqualToString:@"progressValue"]) {

        CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:event];
        animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
        animation.fromValue = @([[self presentationLayer] progressValue]);
        animation.duration = 0.5f;

        return animation;
    }
    return [super actionForKey:event];
}

+ (BOOL)needsDisplayForKey:(NSString *)key {
    if ([key isEqualToString:@"progressValue"]) {
        return YES;
    }
    return [super needsDisplayForKey:key];
}

@end
