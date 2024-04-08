//
//  ViewController.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import "ViewController.h"
#import "Cell/ImageCell.h"
#import "Helper/DownloadImageHelper.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)config {
    [self fetchData];
    [self configTableView];
}


- (void)configTableView {
    [self.imageTableView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:@"ImageCell"];
    self.imageTableView.delegate = self;
    self.imageTableView.dataSource = self;
}

- (void)fetchData {
    const NSInteger maxItems = 100;
    self.urlStrings = [NSMutableArray array];
    for (int i = 0; i < maxItems; i++) {
        NSString *urlString = [NSString stringWithFormat:@"https://github.com/linhnd99/Image2K/blob/main/%03d.png?raw=true", i];
        [self.urlStrings addObject:urlString];
    }
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.urlStrings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ImageCell";
    ImageCell * cell = [self.imageTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        return  [UICollectionViewCell init];
    }
    
    [cell bindDataWithURLString:self.urlStrings[indexPath.row]];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end

