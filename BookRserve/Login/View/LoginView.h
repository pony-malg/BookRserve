//
//  LoginView.h
//  BookRserve
//
//  Created by jay on 2019/3/30.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^loginBlock)(NSString *account,NSString *pwd);
typedef void (^reBlock)(void);

@interface LoginView : UIView

@property (nonatomic,strong)UIImageView *bgImageView;
@property (nonatomic,strong)UITextField *accountTextField;
@property (nonatomic,strong)UITextField *pwdTextField;
@property (nonatomic,strong)UIButton *loginBtn;
@property (nonatomic,strong)UIButton *registerBtn;
@property (nonatomic,copy)loginBlock myBlock;
@property (nonatomic,copy)reBlock myRegisterBlock;

@end

NS_ASSUME_NONNULL_END
