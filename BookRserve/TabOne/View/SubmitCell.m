//
//  SubmitTableViewCell.m
//  PhysicalTest
//
//  Created by jay on 2019/3/28.
//  Copyright © 2019 jay. All rights reserved.
//

#import "SubmitCell.h"
#import <Masonry.h>

@interface SubmitCell()<UITextFieldDelegate,UITextViewDelegate>

@end

@implementation SubmitCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self configUI];
    }
    return self;
}
- (void)configUI{
    _titleLab = [[UILabel alloc] init];
    //_titleLab.backgroundColor = [UIColor lightGrayColor];
    //_titleLab.textAlignment = NSTextAlignmentRight;
    [self.contentView addSubview:_titleLab];
    [_titleLab sizeToFit];
    _titleLab.numberOfLines = 0;
    [_titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(5);
        make.right.equalTo(self.contentView.mas_centerX);
        make.height.mas_equalTo(40);
    }];
    
    _fillTextField = [[UITextField alloc] init];
    _fillTextField.delegate = self;
    //_fillTextField.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_fillTextField];
    [_fillTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
        make.left.equalTo(self.contentView.mas_centerX);
    }];
    
    _fillTextView = [[UITextView alloc] init];
    _fillTextView.layer.cornerRadius = 5;
    _fillTextView.layer.masksToBounds = YES;
    _fillTextView.layer.borderWidth = 1;
    _fillTextView.layer.borderColor = [UIColor lightGrayColor].CGColor;
    _fillTextView.delegate = self;
    //_fillTextField.backgroundColor = [UIColor yellowColor];
    [self.contentView addSubview:_fillTextView];
    [_fillTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.contentView).offset(-10);
        make.top.equalTo(self.contentView).offset(5);
        make.bottom.equalTo(self.contentView).offset(-5);
        make.left.equalTo(self.contentView.mas_centerX);
    }];
}
#pragma mark - textField
- (void)textFieldDidEndEditing:(UITextField *)textField{
    if (self.textBlock) {
        self.textBlock(textField.text);
    }
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    if (self.textBlock) {
        self.textBlock(textView.text);
    }
}


@end
