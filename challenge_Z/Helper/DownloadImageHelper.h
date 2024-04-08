//
//  DownloadImageHelper.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#ifndef DownloadImageHelper_h
#define DownloadImageHelper_h


#endif /* DownloadImageHelper_h */
#import <UIKit/UIKit.h>
#import "ImageDownloadTask.h"
#import "CacheImageHelper.h"

@interface DownloadImageHelper : NSObject
@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSMutableDictionary<NSURL *, ImageDownloadTask *> *tasks;
- (void)cancelDownloadForURL:(NSURL *)url;
- (void)downloadImageWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion;
@end
