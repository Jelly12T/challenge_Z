//
//  DownloadImageHelper.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <Foundation/Foundation.h>
#import "DownloadImageHelper.h"

@implementation DownloadImageHelper

- (instancetype)init {
    self = [super init];
    if (self) {
        _queue = [[NSOperationQueue alloc] init];
        _queue.maxConcurrentOperationCount = 4;
    }
    return self;
}

+ (instancetype)shared {
    static DownloadImageHelper *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}


- (void)downloadImageFromURLs:(NSArray<NSString *> *)urlStrings completion:(void (^__strong)(UIImage *__strong))completion {
    dispatch_group_t downloadGroup = dispatch_group_create();
}

-(void)downloadImageFromURL:(NSString *)urlString completion:(void (^__strong)(UIImage *__strong))completion { 
}

@end

