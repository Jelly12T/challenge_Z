//
//  ImageCell.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <UIKit/UIKit.h>
#import "DownloadImageHelper.h"

@interface ImageCell : UITableViewCell
@property (nonatomic, strong) NSURL *currentURL;
@property (nonatomic, strong) DownloadImageHelper *downloadHelper;
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

- (void)bindDataWithURLString:(NSString *)urlString;
- (void)updateLoadingView: (BOOL)isShow;
@end

