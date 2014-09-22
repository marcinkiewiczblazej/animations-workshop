#import <Foundation/Foundation.h>


@interface RefreshTableViewCell : UITableViewCell
@property(nonatomic, readonly) UIImageView *imageV;

- (void)animateImage:(UIImage *)image;
@end
