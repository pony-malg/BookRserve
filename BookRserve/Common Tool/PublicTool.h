//
//  PublicTool.h
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicTool : NSObject

+ (UIColor *)getColor;
+ (void)gotoMainViewControlelr;
+ (void)gotoLoginViewControlelr;
+ (void)gotoRegisterViewControllerWith:(id)target;
+ (void)backLoginViewControllerWith:(id)target;
+ (void)showHUDWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
