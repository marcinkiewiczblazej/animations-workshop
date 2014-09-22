#import "MenuViewController.h"

static NSString *const reuseIdentifier = @"reuseIdentifier";

@interface MenuViewController ()
@property(nonatomic, strong) NSArray *options;
@end

@implementation MenuViewController {

}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.options = @[@"Swap", @"Refresh", @"Progress", @"Easing"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.options.count;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.textLabel.text = self.options[(NSUInteger) indexPath.row];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self.menuViewControllerDelegate menuViewController:self didSelectOption:indexPath.row];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [tableView dequeueReusableCellWithIdentifier:reuseIdentifier forIndexPath:indexPath];
}


@end
