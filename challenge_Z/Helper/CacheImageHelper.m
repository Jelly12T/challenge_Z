//
//  CacheImageHelper.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <Foundation/Foundation.h>
#import "CacheImageHelper.h"

@implementation CacheImageHelper

+ (instancetype)shared {
    static CacheImageHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (UIImage * _Nullable)getImageCached:(NSString *)imageURL {
    return nil;
}

- (void)cacheImageWithURL:(NSString * _Nonnull)imageURL image:(UIImage * _Nonnull)image {
}

@end
