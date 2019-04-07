//
//  MyBookCell.h
//  BookRserve
//
//  Created by jay on 2019/4/2.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyBookCell : UITableViewCell

@property (nonatomic,strong)UILabel *bookName;
@property (nonatomic,strong)UILabel *authorLabel;
@property (nonatomic,strong)UILabel *house;
@property (nonatomic,strong)UILabel *time;//改成时间
@property (nonatomic,strong)UILabel *address;//改成地址

@end

NS_ASSUME_NONNULL_END
