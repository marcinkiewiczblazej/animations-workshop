#import "RefreshTableViewCell.h"


@interface RefreshTableViewCell ()
@property(nonatomic, readwrite) UIImageView *imageV;
@property(nonatomic, strong) UIImageView *backingImageView;
@property(nonatomic, strong) CABasicAnimation *animation;
@end

@implementation RefreshTableViewCell {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backingImageView = [[UIImageView alloc] init];
//        self.backingImageView.layer.opacity = 0.f;
        [self.contentView addSubview:self.backingImageView];

        self.imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageV];


        CAShapeLayer *mask = [[CAShapeLayer alloc] init];
        self.imageV.layer.mask = mask;
    }

    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageV.frame = self.contentView.bounds;
    self.backingImageView.frame = self.contentView.bounds;
    self.backingImageView.layer.mask.frame = self.backingImageView.bounds;
}

- (void)animateImage:(UIImage *)image {
    [self.imageV.layer removeAllAnimations];

    CGFloat centerX = self.imageV.frame.size.width * 0.5f;
    CGFloat centerY = self.imageV.frame.size.height * 0.5f;

    CGPathRef path = CGPathCreateWithRect(CGRectMake(centerX, centerY, 0, 0), NULL);
    CGPathRef otherPath = CGPathCreateWithRect(self.backingImageView.bounds, NULL);

    CABasicAnimation *animation = [[CABasicAnimation alloc] init];
    animation.delegate = self;
    animation.keyPath = @"path";
    animation.fromValue = (__bridge id) otherPath;
    animation.toValue = (__bridge id) path;
    animation.duration = 1.f;

    self.animation = animation;

    CGPathRelease(otherPath);
    CGPathRelease(path);

    self.backingImageView.image = image;

    [self.imageV.layer.mask addAnimation:self.animation forKey:@"swaps"];
}

-(void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    if (flag) {
        self.imageV.image = self.backingImageView.image;
    }
}
@end
