#import "ProgressLayer.h"


@implementation ProgressLayer {

}

- (void)display {
    [super display];

    //create drawing context
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();

    NSString *valueString = [NSString stringWithFormat:@"%@", @(self.progressValue)];

    NSMutableParagraphStyle *style = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    [style setAlignment:NSTextAlignmentCenter];

    [valueString drawInRect:self.bounds withAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:40], NSParagraphStyleAttributeName : style}];
    //set backing image
    self.contents = (id)UIGraphicsGetImageFromCurrentImageContext().CGImage;
    UIGraphicsEndImageContext();
}

- (void)setProgressValue:(NSUInteger)progressValue {
    _progressValue = progressValue;
    [self setNeedsDisplay];
}


@end
