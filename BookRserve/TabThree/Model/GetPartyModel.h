//
//  GetPartyModel.h
//  BookRserve
//
//  Created by jay on 2019/4/7.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PartyModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GetPartyModel : NSObject

@property (nonatomic,copy)NSString *status;
@property (nonatomic,strong)NSArray<PartyModel*> *partys;

@end

NS_ASSUME_NONNULL_END
