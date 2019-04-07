//
//  RegisterView.h
//  BookRserve
//
//  Created by jay on 2019/4/2.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^registerBlock) (NSString *userNa,NSString *pwd);
typedef void (^cancelBlock) (void);

@interface RegisterView : UIView

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UITextField *accountTextField;
@property (nonatomic,strong)UITextField *pwdTextField;
@property (nonatomic,strong)UITextField *pwdSureTextField;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *cancelBtn;
@property (nonatomic,copy)cancelBlock canBlock;
@property (nonatomic,copy)registerBlock backLoingBlock;

@end

NS_ASSUME_NONNULL_END
