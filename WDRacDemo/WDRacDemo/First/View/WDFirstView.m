//
//  WDFirstView.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import "WDFirstView.h"

@interface WDFirstView ()

@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *nameLabel;

@end


@implementation WDFirstView
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initSubViews];
    }
    return self;
}

- (void)initSubViews {
    
    self.iconImageView = [[UIImageView alloc] init];
    [self addSubview:self.iconImageView];
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.iconImageView.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    
}


- (void)setViewModel:(WDFirstViewModel *)viewModel {
    _viewModel = viewModel;
    
    kWeakSelf
    [viewModel.racCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        WDFirstModel *model = (WDFirstModel *)x;
        weakSelf.nameLabel.text = model.name;
        [weakSelf.iconImageView sd_setImageWithURL:[NSURL URLWithString:model.iconUrlString] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                    
        }];
    }];
    
}
@end
