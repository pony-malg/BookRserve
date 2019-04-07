//
//  buyBookCell.h
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^buyBlock) (void);

@interface buyBookCell : UITableViewCell

@property (nonatomic,strong)UILabel *bookName;
@property (nonatomic,strong)UILabel *authorLabel;
@property (nonatomic,strong)UILabel *house;
@property (nonatomic,strong)UILabel *oldDegree;
@property (nonatomic,strong)UILabel *Person;
@property (nonatomic,strong)UILabel *teleLabel;
@property (nonatomic,strong)UILabel *timeLabel;
@property (nonatomic,strong)UILabel *addressLabel;
@property (nonatomic,strong)UIButton *dealBtn;

@property (nonatomic,copy)buyBlock buyBookBlock;
@end

NS_ASSUME_NONNULL_END
