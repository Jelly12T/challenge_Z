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
@property (nonatomic, strong) NSCache *ramCache;
@property (nonatomic, strong) NSString *diskCachePath;
@property (nonatomic, assign) NSUInteger totalCapacityRamCache;

+ (id)shared;
- (void)addCacheImage:(UIImage *)image forKey:(NSString *)key;
- (UIImage *)getImageCachedForKey:(NSString *)key;
@end
