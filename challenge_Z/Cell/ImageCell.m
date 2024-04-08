//
//  ImageCell.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import "ImageCell.h"
#import "DownloadImageHelper.h"

@implementation ImageCell
- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.downloadHelper = [[DownloadImageHelper alloc] init];
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    if( self.thumbnailImage.image == nil) {
        [self.downloadHelper cancelDownloadForURL:self.currentURL];

    }
    
    [self updateLoadingView:false];
    self.thumbnailImage.image = nil;
    
}

- (void)bindDataWithURLString:(NSString *)urlString  {
    [self updateLoadingView:false];
    self.currentURL = [NSURL URLWithString:urlString];
    [self.downloadHelper downloadImageWithURL:self.currentURL completion:^(UIImage *image) {
        [self updateLoadingView:true];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.thumbnailImage.image = image;
        });
    }];
}

- (void)updateLoadingView:(BOOL)isShow {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.loadingView setHidden:isShow];
        if(isShow) {
            [self.loadingView startAnimating];
        } else {
            [self.loadingView stopAnimating];
        }
    });
}

@end
