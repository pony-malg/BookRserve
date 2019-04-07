//
//  HeaderView.h
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^headBlock) (NSInteger tagNumber);

@interface HeaderView : UIView

@property (nonatomic,strong)UIButton *bookJoin;
@property (nonatomic,strong)UIButton *bookSell;
@property (nonatomic,strong)UIButton *bookBuy;
@property (nonatomic,copy)headBlock myHeadBlock;

@end

NS_ASSUME_NONNULL_END
