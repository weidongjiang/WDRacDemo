//
//  WDFirstView.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import "WDFirstView.h"

@interface WDFirstView ()

@property (nonatomic, strong) UIButton *iconButton;
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
    
    self.iconButton = [[UIButton alloc] init];
    [self.iconButton addTarget:self action:@selector(iconButtonDid:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.iconButton];
    [self.iconButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.equalTo(self);
        make.width.height.mas_equalTo(50);
    }];
    
    self.nameLabel = [[UILabel alloc] init];
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:14];
    [self addSubview:self.nameLabel];
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.equalTo(self.iconButton.mas_bottom).offset(10);
        make.height.mas_equalTo(20);
    }];
    
    [[self.iconButton rac_signalForSelector:@selector(iconButtonDid:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"iconButton rac_signalForSelector:%@",x);
    }];
}

- (void)iconButtonDid:(UIButton *)btn {
    [self.viewModel.firstViewiconDidSubject  sendNext:self.viewModel.model];
}

- (void)setViewModel:(WDFirstViewModel *)viewModel {
    _viewModel = viewModel;
    
    kWeakSelf
    [viewModel.racCommand.executionSignals.switchToLatest subscribeNext:^(id  _Nullable x) {
        WDFirstModel *model = (WDFirstModel *)x;
        weakSelf.nameLabel.text = model.name;
        ;
        [weakSelf.iconButton setBackgroundImage:[UIImage sd_imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.iconUrlString]]] forState:UIControlStateNormal];
    }];
    
    [viewModel.viewDidLoadSubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"viewDidLoad Subject");
    }];
    
    [viewModel.racCommand.executionSignals subscribeNext:^(id  _Nullable x) {
        NSLog(@"executionSignals ---- :%@",x);
    }];
    [viewModel.racCommand.executing subscribeNext:^(NSNumber * _Nullable x) {
        NSLog(@"executing ---- :%@",x);

    }];
    [viewModel.racCommand.errors subscribeNext:^(NSError * _Nullable x) {
        NSLog(@"errors ---- :%@",x);

    }];
}
@end
