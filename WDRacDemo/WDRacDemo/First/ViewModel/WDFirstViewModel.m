//
//  WDFirstViewModel.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import "WDFirstViewModel.h"

@implementation WDFirstViewModel

- (RACCommand *)racCommand {
    if (!_racCommand) {
        kWeakSelf
        _racCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal * _Nonnull(id  _Nullable input) {
            RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
                
                // 网络数据处理 耗时操作
                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                    WDFirstModel *model = [[WDFirstModel alloc] init];
                    weakSelf.model = model;
                    model.userID = @"123456";
                    model.name = @"first";
                    model.iconUrlString = @"http://aop.huoying666.com/images/20210517/89cc040611e30a18b213968e730ec54d/89cc040611.jpg_home-image-1080";
                    
                    [subscriber sendNext:model];
                    [subscriber sendCompleted];
                });
                return nil;
            }];
            return signal;
        }];
    }
    return _racCommand;
}

- (RACSubject *)viewDidLoadSubject {
    if (!_viewDidLoadSubject) {
        _viewDidLoadSubject = [[RACSubject alloc] init];
    }
    return _viewDidLoadSubject;
}

- (RACSubject *)firstViewiconDidSubject {
    if (!_firstViewiconDidSubject) {
        _firstViewiconDidSubject = [[RACSubject alloc] init];
    }
    return _firstViewiconDidSubject;
}

@end
