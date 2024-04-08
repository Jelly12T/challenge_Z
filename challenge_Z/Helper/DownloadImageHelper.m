//
//  DownloadImageHelper.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <Foundation/Foundation.h>
#import "DownloadImageHelper.h"
#import "ImageDownloadTask.h"

@implementation DownloadImageHelper

- (id)init {
    self = [super init];
    if (self) {
        self.queue = [[NSOperationQueue alloc] init];
        self.queue.maxConcurrentOperationCount = 4;
    }
    return self;
}

- (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion {
    UIImage *image = [[CacheImageHelper shared] getImageCachedForKey:url.path];
    if(image) {
        NSLog(@"JELLY have cache");
        completion(image);
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        ImageDownloadTask *task = [[ImageDownloadTask alloc] initWithURL:url completion:^(UIImage *imageDownloaded) {
            if(imageDownloaded) {
                [[CacheImageHelper shared] addCacheImage:imageDownloaded forKey:url.path];
            }
            
            completion(imageDownloaded);
        }];
        
        [self.queue addOperation:task];
    });
}

- (void)cancelDownloadForURL:(NSURL *)url {
    ImageDownloadTask *task = self.tasks[url];
    [task cancel];
    [self.tasks removeObjectForKey:url];
}

@end

