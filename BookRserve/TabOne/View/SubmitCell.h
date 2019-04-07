//
//  SubmitTableViewCell.h
//  PhysicalTest
//
//  Created by jay on 2019/3/28.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^myBlock) (NSString *myText);

@interface SubmitCell : UITableViewCell

@property (nonatomic,strong)UILabel *titleLab;
@property (nonatomic,strong)UITextField *fillTextField;
@property (nonatomic,copy)myBlock textBlock;
@property (nonatomic,strong)UITextView *fillTextView;

@end

NS_ASSUME_NONNULL_END
