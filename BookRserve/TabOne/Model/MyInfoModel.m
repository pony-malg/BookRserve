//
//  MyInfoModel.m
//  BookRserve
//
//  Created by jay on 2019/4/1.
//  Copyright © 2019 jay. All rights reserved.
//

#import "MyInfoModel.h"


@implementation MyInfoModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"books" : [MyBookList class]};
}

@end
