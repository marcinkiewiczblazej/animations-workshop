#import "RootView.h"


@interface RootView ()
@property (nonatomic) BOOL open;
@end

@implementation RootView {

}

- (void)layoutSubviews {
    [super layoutSubviews];

    CGFloat menuWidth = 200;

    if (self.open) {
        self.menuView.frame = CGRectMake(0, 0, menuWidth, self.bounds.size.height);
        self.contentView.frame = CGRectMake(CGRectGetMaxX(self.menuView.frame), 0, self.bounds.size.width, self.bounds.size.height);
    } else {
        self.menuView.frame = CGRectMake(-menuWidth, 0, menuWidth, self.bounds.size.height);
        self.contentView.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height);
    }
}

- (void)openMenu {
    self.open = YES;
    [self setNeedsLayout];
}

- (void)closeMenu {
    self.open = NO;
    [self setNeedsLayout];
}

- (void)setMenuView:(UIView *)menuView {
    [_menuView removeFromSuperview];
    _menuView = menuView;
    [self addSubview:_menuView];
}

- (void)setContentView:(UIView *)contentView {
    [_contentView removeFromSuperview];
    _contentView = contentView;
    [self addSubview:_contentView];
}


@end
