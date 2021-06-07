//
//  WDFirstViewController.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import "WDFirstViewController.h"
#import "WDFirstViewModel.h"
#import "WDFirstView.h"
#import "WDUserViewController.h"

@interface WDFirstViewController ()

@property (nonatomic, strong) WDFirstViewModel *viewModel;
@property (nonatomic, strong) WDFirstView *firstView;

@end

@implementation WDFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor greenColor];
    kWeakSelf
    [self.viewModel.viewDidLoadSubject sendNext:@"viewDidLoad"];
    [self.viewModel.firstViewiconDidSubject subscribeNext:^(id  _Nullable x) {
        WDFirstModel *model = (WDFirstModel *)x;
        NSLog(@"user id:%@",model.userID);
        WDUserViewController *vc = [[WDUserViewController alloc] init];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
    
    
    [self.view addSubview:self.firstView];
    self.firstView.viewModel = self.viewModel;
    [self.firstView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(30);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(80);
    }];
    
    // 监听firstView iconButtonDid 方法，代替其他的事件传递方法
    [[self.firstView rac_signalForSelector:@selector(iconButtonDid:)] subscribeNext:^(RACTuple * _Nullable x) {
        NSLog(@"rac_signalForSelector iconButtonDid:%@",x);
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.viewModel.racCommand execute:@"viewWillAppear"];
    
    
    
}

- (WDFirstViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[WDFirstViewModel alloc] init];
    }
    return _viewModel;
}

- (WDFirstView *)firstView {
    if (!_firstView) {
        _firstView = [[WDFirstView alloc] init];
    }
    return _firstView;
}

@end
