//
//  PartyModel.h
//  BookRserve
//
//  Created by jay on 2019/4/7.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PartyModel : NSObject

@property (nonatomic,copy)NSString *isJoined;
@property (nonatomic,copy)NSString *UUID;
@property (nonatomic,copy)NSString *address;
@property (nonatomic,copy)NSString *content;
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *leading;

@end

NS_ASSUME_NONNULL_END
