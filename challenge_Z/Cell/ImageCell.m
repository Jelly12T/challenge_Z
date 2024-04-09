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
    
    self.thumbnailImage.image = nil;
    [self.downloadHelper cancelDownloadForURL:self.currentURL];
    [self updateLoadingView:false];
}

- (void)bindDataWithURLString:(NSString *)urlString  {
    [self updateLoadingView:false];
    self.currentURL = [NSURL URLWithString:urlString];
    [self.downloadHelper downloadImageWithURL:self.currentURL completion:^(UIImage *image) {
        if(!image) {
            return;
        }
        
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
