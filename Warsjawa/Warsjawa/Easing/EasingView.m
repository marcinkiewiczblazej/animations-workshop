#import "EasingView.h"


@interface EasingView ()
@property(nonatomic, strong) UIView *rectangleView;
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
    }

    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];

    self.rectangleView.frame = CGRectMake(0, 0, 100, 100);
    self.rectangleView.center = CGPointMake(self.center.x, self.center.y);
}

- (void)animateLeft {
    self.rectangleView.center = CGPointMake(self.rectangleView.frame.size.width * 0.5f, self.rectangleView.center.y);
}

- (void)animateRight {
    self.rectangleView.center = CGPointMake(self.bounds.size.width - self.rectangleView.frame.size.width * 0.5f, self.rectangleView.center.y);
}

@end
