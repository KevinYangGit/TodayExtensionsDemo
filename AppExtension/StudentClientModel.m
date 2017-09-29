//
//  StudentClientModel.m
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/10.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import "StudentClientModel.h"
//#import <AFNetworking.h>


@implementation StudentClientModel

- (instancetype)initWithAttributes:(NSDictionary *)attributes {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    return self;
}

//+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSArray *posts, NSError *error))block {
//    return [[AFHTTPSessionManager manager] GET:@""
//                                    parameters:nil
//                                      progress:nil
//                                       success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//
//                                       } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
//
//                                       }];
//}


@end

@implementation StudentClientModel (NSCoding)

- (void)encodeWithCoder:(NSCoder *)aCoder {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (BOOL)supportsSecureCoding {
    return YES;
}

@end
