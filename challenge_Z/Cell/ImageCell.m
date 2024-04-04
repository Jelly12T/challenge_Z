//
//  ImageCell.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import "ImageCell.h"
#import "DownloadImageHelper.h"

@implementation ImageCell

- (void)prepareForReuse {
    [super prepareForReuse];
    self.thumbnailImage.image = nil;
    [self updateLoadingView: YES];
}

- (void)bindData:(UIImage *)image {
    self.thumbnailImage.image = image;
}

- (void)updateLoadingView:(BOOL)isShow {
    if(isShow) {
        [self.loadingView startAnimating];
    } else {
        [self.loadingView stopAnimating];
    }
}

@end
