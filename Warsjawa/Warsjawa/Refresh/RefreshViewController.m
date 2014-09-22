#import "RefreshViewController.h"
#import "RefreshTableViewCell.h"
#import "UIImageView+AFNetworking.h"

static NSString *const reuseIdentifier = @"reuseIdentifier";

@interface RefreshViewController ()
@property(nonatomic, strong) NSArray *urls;
@end

@implementation RefreshViewController {

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.urls = @[@"http://pixabay.com/static/uploads/photo/2014/08/23/11/36/beach-425167_640.jpg?attachment",
    @"http://pixabay.com/static/uploads/photo/2014/08/29/11/29/the-sun-430992_640.jpg?attachment",
    @"http://pixabay.com/static/uploads/photo/2014/08/24/20/19/forest-426624_640.jpg?attachment",
    @"http://pixabay.com/static/uploads/photo/2014/08/23/11/32/antelope-425161_640.jpg?attachment",
    @"http://pixabay.com/static/uploads/photo/2014/08/23/19/57/man-425691_640.jpg?attachment"];

    [self.tableView registerClass:[RefreshTableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urls.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell.imageView cancelImageRequestOperation];
    cell.imageView.image = nil;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[[NSURL alloc] initWithString:self.urls[(NSUInteger) indexPath.row]]];
    [request addValue:@"image/*" forHTTPHeaderField:@"Accept"];

    RefreshTableViewCell *refreshTableViewCell = (RefreshTableViewCell *)cell;
    __weak RefreshTableViewCell *weakCell = refreshTableViewCell;
    [refreshTableViewCell.imageV setImageWithURLRequest:request placeholderImage:[UIImage imageNamed:@"Placeholder.png"] success:^(NSURLRequest *req, NSHTTPURLResponse *response, UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakCell.imageV.image = image;
        });
    }                                           failure:nil];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
}
@end
