//
//  CacheImageHelper.m
//  challenge_Z
//
//  Created by Thach Le Hoang on 4/4/24.
//

#import <Foundation/Foundation.h>
#import "CacheImageHelper.h"

@implementation CacheImageHelper
NSUInteger maxRamCache = 30 * 1024 * 1024;

+ (id)shared {
    static CacheImageHelper *shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shared = [[self alloc] init];
    });
    
    return shared;
}

- (id)init {
    if (self = [super init]) {
        self.ramCache = [[NSCache alloc] init];
        self.ramCache.totalCostLimit = maxRamCache;
        self.totalCapacityRamCache = 0;
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
        self.diskCachePath = [paths[0] stringByAppendingPathComponent:@"ImageCache"];
        if (![[NSFileManager defaultManager] fileExistsAtPath:self.diskCachePath]) {
            [[NSFileManager defaultManager] createDirectoryAtPath:self.diskCachePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
    }
    
    return self;
}

- (void)addCacheImage:(UIImage *)image forKey:(NSString *)key {
    NSData *imageData = UIImagePNGRepresentation(image);
    if (self.totalCapacityRamCache + imageData.length <= maxRamCache) {
        [self.ramCache setObject:imageData forKey:key];
        self.totalCapacityRamCache += imageData.length;
    }
    
    NSString *filePath = [self.diskCachePath stringByAppendingPathComponent:key];
    [imageData writeToFile:filePath atomically:YES];
}

- (UIImage *)getImageCachedForKey:(NSString *)key {
    NSData *imageData = [self.ramCache objectForKey:key];
    if (!imageData) {
        NSString *filePath = [self.diskCachePath stringByAppendingPathComponent:key];
        imageData = [NSData dataWithContentsOfFile:filePath];
    }
        
    return imageData ? [UIImage imageWithData:imageData] : nil;
}

@end
