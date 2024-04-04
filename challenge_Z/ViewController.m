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
@property (nonatomic, strong) DownloadImageHelper *downloadImageHelper;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self config];
}

- (void)config {
    [self configDownloadImageHelper];
    [self configTableView];
    [self fetchData];
}

- (void)configDownloadImageHelper {
    self.downloadImageHelper = [DownloadImageHelper shared];
}

- (void)configTableView {
    [self.imageTableView registerNib:[UINib nibWithNibName:@"ImageCell" bundle:nil] forCellReuseIdentifier:@"ImageCell"];
    self.imageTableView.delegate = self;
    self.imageTableView.dataSource = self;
}

- (void)fetchData {
    
}

#pragma mark - UITableViewDataSource Methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"ImageCell";
    ImageCell * cell = [self.imageTableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        return  [UICollectionViewCell init];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

@end

