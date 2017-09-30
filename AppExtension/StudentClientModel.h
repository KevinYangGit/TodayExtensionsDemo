//
//  StudentClientModel.h
//  AppExtensionsDemo
//
//  Created by YangQi on 2017/8/10.
//  Copyright © 2017年 YangQI. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StudentClientModel : NSObject

@property (nonatomic,copy) NSString *ownerName;
@property (nonatomic,copy) NSString *resourceName;
@property (nonatomic,copy) NSString *recommendText;
@property (nonatomic,copy) NSString *resourcePicUrl;

+ (NSURLSessionDataTask *)globalTimelinePostsWithBlock:(void (^)(NSDictionary *posts, NSError *error))block;

@end

@interface StudentClientModel (NSCoding) <NSSecureCoding>

@end
