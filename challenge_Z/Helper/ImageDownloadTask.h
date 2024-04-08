//
//  ImageDownloadTask.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 8/4/24.
//

#ifndef ImageDownloadTask_h
#define ImageDownloadTask_h


#endif /* ImageDownloadTask_h */
#import <Foundation/Foundation.h>

@interface ImageDownloadTask : NSOperation
@property (nonatomic, strong) NSURLSessionDownloadTask *downloadTask;
@property (nonatomic, strong) NSURL *url;
@property (nonatomic, copy) void (^completion)(UIImage *);
- (id)initWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion;
@end

