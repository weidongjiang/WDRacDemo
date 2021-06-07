//
//  WDUserViewController.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import "WDUserViewController.h"

@interface WDUserViewController ()

@property (nonatomic, strong) UITextField *textField;
@property (nonatomic, strong) RACDisposable *disposable;

@end

@implementation WDUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//    [self rac_test_Notification];
//    [self rac_test_interval_delay];
//    [self rac_test_button];
//    [self rac_test_textField];
    
}


- (void)rac_test_Notification {
    
    [[[NSNotificationCenter defaultCenter] rac_addObserverForName:@"rac_test_Notification" object:nil] subscribeNext:^(NSNotification * _Nullable x) {
        NSLog(@"rac_test_Notification :%@",x);
    }];
    
}

- (void)rac_test_interval_delay {

    self.disposable = [[RACSignal interval:3 onScheduler:[RACScheduler mainThreadScheduler]] subscribeNext:^(NSDate * _Nullable x) {

        NSLog(@"定时器：%@",x);
        
    }];
    
    [[[RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        [subscriber sendNext:@"延迟7秒"];
        return nil;
        }] delay:7] subscribeNext:^(id  _Nullable x) {
            NSLog(@"delay subscribeNext:%@",x);
            
            // 销毁定时器
            [self.disposable dispose];
        }];
}

- (void)rac_test_button {
    
    UIButton *button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    [[button rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"button rac_signalForControlEvents:%@",x);

    }];
}

- (void)rac_test_textField {
    
    self.textField = [[UITextField alloc] init];
    self.textField.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.textField];
    [self.textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(100);
        make.left.equalTo(self.view).offset(20);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(30);
    }];
    
    // 监听 textField 的输入框的类容
    [[self.textField rac_textSignal] subscribeNext:^(NSString * _Nullable x) {
            NSLog(@"textField rac_textSignal:%@",x);
    }];
    
    // 根据特定 事件 监听
    [[self.textField rac_signalForControlEvents:UIControlEventEditingChanged] subscribeNext:^(__kindof UIControl * _Nullable x) {
        NSLog(@"textField rac_signalForControlEvents:%@",x);
    }];
    
    // 有条件的监听 当输入框的内容大于时 接受subscribeNext
    [[self.textField.rac_textSignal filter:^BOOL(NSString * _Nullable value) {
            return value.length > 8;
        }] subscribeNext:^(NSString * _Nullable x) {
            NSLog(@"textField.rac_textSignal filter subscribeNext:%@",x);
        }];
}


@end
