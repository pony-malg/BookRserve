//
//  FooterView.h
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^footBlock) (void);

@interface FooterView : UIView

@property (nonatomic,copy)footBlock myFooterButtonBlock;

@end

NS_ASSUME_NONNULL_END
