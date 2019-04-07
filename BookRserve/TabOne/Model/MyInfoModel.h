//
//  MyInfoModel.h
//  BookRserve
//
//  Created by jay on 2019/4/1.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyBookList.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyInfoModel : NSObject

@property (nonatomic,copy)NSString *status;
@property (nonatomic,strong)NSArray<MyBookList *> *books;

@end

NS_ASSUME_NONNULL_END
