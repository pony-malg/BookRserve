//
//  HaveSellBookTableViewCell.h
//  BookRserve
//
//  Created by jay on 2019/3/31.
//  Copyright © 2019 jay. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^sellBlock) (NSString *telStr);

@interface HaveSellBookCell : UITableViewCell

@property (nonatomic,strong)UILabel *bookName;
@property (nonatomic,strong)UILabel *issueTime;
@property (nonatomic,strong)UILabel *addressBook;
@property (nonatomic,strong)UILabel *buyer;
@property (nonatomic,strong)UILabel *buyerTel;
@property (nonatomic,copy)sellBlock mySellBlock;

@end

NS_ASSUME_NONNULL_END
