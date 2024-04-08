//
//  ImageDownloadTask.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 8/4/24.
//

#import "UIKit/UIKit.h"
#import "ImageDownloadTask.h"


@implementation ImageDownloadTask {
    BOOL _isExecuting;
    BOOL _isFinished;
}

- (id)initWithURL:(NSURL *)url completion:(void (^)(UIImage *))completion {
    self = [super init];
    if (self) {
        self.url = url;
        self.completion = completion;
        _isExecuting = NO;
        _isFinished = NO;
    }
    return self;
}

- (void)start {
    if (self.isCancelled) {
        [self willChangeValueForKey:@"isFinished"];
        _isFinished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }

    [self willChangeValueForKey:@"isExecuting"];
    _isExecuting = YES;
    [self didChangeValueForKey:@"isExecuting"];

    NSURLSession *session = [NSURLSession sharedSession];
    self.downloadTask = [session downloadTaskWithURL:self.url completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error) {
        UIImage *image = nil;
        if (location) {
            NSData *data = [NSData dataWithContentsOfURL:location];
            image = [UIImage imageWithData:data];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.completion(image);
        });

        [self willChangeValueForKey:@"isExecuting"];
        [self willChangeValueForKey:@"isFinished"];
        _isExecuting = NO;
        _isFinished = YES;
        [self didChangeValueForKey:@"isExecuting"];
        [self didChangeValueForKey:@"isFinished"];
    }];
    [self.downloadTask resume];
}

- (void)cancel {
    [self.downloadTask cancelByProducingResumeData:^(NSData *resumeData) {
        // Handle the resume data if you want to be able to resume the download later
    }];

    [super cancel];
}

- (BOOL)isExecuting {
    return _isExecuting;
}

- (BOOL)isFinished {
    return _isFinished;
}

@end
