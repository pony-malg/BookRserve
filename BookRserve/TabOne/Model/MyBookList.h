//
//  MyBookList.h
//  BookRserve
//
//  Created by jay on 2019/4/1.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyBookList : NSObject

@property (nonatomic,copy)NSString *status;
@property (nonatomic,copy)NSString *UUID;
@property (nonatomic,copy)NSString *title;//书名
@property (nonatomic,copy)NSString *author;
@property (nonatomic,copy)NSString *publishingHouse;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *depreciationRate;//折旧率
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *phone;
@property (nonatomic,copy)NSString *time;

@end

NS_ASSUME_NONNULL_END
