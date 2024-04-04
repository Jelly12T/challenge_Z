//
//  CacheImageHelper.h
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#ifndef CacheImageHelper_h
#define CacheImageHelper_h


#endif /* CacheImageHelper_h */
#import <UIKit/UIKit.h>

@interface CacheImageHelper : NSObject

+ (instancetype _Nonnull)shared;
- (void)cacheImageWithURL:(NSString * _Nonnull)imageURL image:(UIImage * _Nonnull)image;
- (UIImage * _Nullable)getImageCached:(NSString * _Nonnull)imageURL;

@end
