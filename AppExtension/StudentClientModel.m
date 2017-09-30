//
//  StudentClientModel.m
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/10.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import "StudentClientModel.h"
#import <AFNetworking.h>


@implementation StudentClientModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSDictionary *posts, NSError *error))block {
    return [[AFHTTPSessionManager manager] GET:@"http://music.163.com/api/dailyselection/get"
                                    parameters:nil
                                      progress:nil
                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                                           if (block) {
                                               block(responseObject, nil);
                                           }
                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                                           if (block) {
                                               block(nil, error);
                                           }
                                       }];
}


@end

@implementation StudentClientModel (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.ownerName forKey:@"StudentClientModel.ownerName"];
    [aCoder encodeObject:self.resourceName forKey:@"StudentClientModel.resourceName"];
    [aCoder encodeObject:self.recommendText forKey:@"StudentClientModel.recommendText"];
    [aCoder encodeObject:self.resourcePicUrl forKey:@"StudentClientModel.resourcePicUrl"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.ownerName = [coder decodeObjectOfClass:[NSString class] forKey:@"StudentClientModel.ownerName"];
    self.resourceName = [coder decodeObjectOfClass:[NSString class] forKey:@"StudentClientModel.resourceName"];
    self.recommendText = [coder decodeObjectOfClass:[NSString class] forKey:@"StudentClientModel.recommendText"];
    self.resourcePicUrl = [coder decodeObjectOfClass:[NSString class] forKey:@"StudentClientModel.resourcePicUrl"];
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
