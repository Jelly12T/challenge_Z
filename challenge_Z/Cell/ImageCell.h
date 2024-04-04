//
//  ImageCell.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *thumbnailImage;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingView;

- (void)bindData: (UIImage *)image;
- (void)updateLoadingView: (BOOL)isShow;
@end

NS_ASSUME_NONNULL_END
