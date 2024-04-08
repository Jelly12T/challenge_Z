//
//  ViewController.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong) NSMutableArray *urlStrings;
@property (weak, nonatomic) IBOutlet UITableView *imageTableView;

@end



