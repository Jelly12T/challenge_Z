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

@interface DownloadImageHelper : NSObject
@property (nonatomic, strong) NSOperationQueue *downloadQueue;
+ (instancetype)shared;
- (void)downloadImageFromURLs:(NSArray<NSString *> *)urlStrings completion:(void (^)(UIImage *image))completion;
@end
