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
        self.tasks = [[NSMutableDictionary<NSURL *, ImageDownloadTask *> alloc] init];
    }
    
    return self;
}

- (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion {
    UIImage *image = [self getImageCachedWithURL:url];
    if(image) {
        NSLog(@"JELLY cache exist");
        completion(image);
        return;
    }
    
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        ImageDownloadTask *task = [[ImageDownloadTask alloc] initWithURL:url completion:^(UIImage *imageDownloaded) {
            if(imageDownloaded) {
                NSLog(@"JELLY cache at key %@", url.path);
                [[CacheImageHelper shared] addCacheImage:imageDownloaded forKey:url.path];
            }
            
            [self.tasks removeObjectForKey:url];
            completion(imageDownloaded);
        }];
        
        if(!self.tasks[url]) {
            self.tasks[url] = task;
        }
        
        [self.queue addOperation:task];
    });
}

- (void)cancelDownloadForURL:(NSURL *)url {
    ImageDownloadTask *task = self.tasks[url];
    NSLog(@"Jelly canceled task at: %@", url.path);
    [task cancel];
    [self.tasks removeObjectForKey:url];
}

- (UIImage *)getImageCachedWithURL:(NSURL *)url {
    UIImage *image = [[CacheImageHelper shared] getImageCachedForKey:url.path];
    return  image;
}

@end

