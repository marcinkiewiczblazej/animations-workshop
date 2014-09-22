#import "RefreshTableViewCell.h"


@interface RefreshTableViewCell ()
@property(nonatomic, readwrite) UIImageView *imageV;
@end

@implementation RefreshTableViewCell {

}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imageV = [[UIImageView alloc] init];
        [self.contentView addSubview:self.imageV];
    }

    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];

    self.imageV.frame = self.contentView.bounds;
}

@end
