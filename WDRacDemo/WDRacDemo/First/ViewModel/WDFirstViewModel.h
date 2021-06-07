//
//  WDFirstViewModel.h
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/7.
//

#import <Foundation/Foundation.h>
#import "WDFirstModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WDFirstViewModel : NSObject

@property (nonatomic, strong) WDFirstModel *model;
//用作 数据处理后 发送信号 view Controller 或者 view 监听，使用数据
@property (nonatomic, strong) RACCommand *racCommand;// 网络数据处理

@property (nonatomic, strong) RACSubject *viewDidLoadSubject;///<view Controller 的生命周期

@property (nonatomic, strong) RACSubject *firstViewiconDidSubject;///< 点击事件


@end

NS_ASSUME_NONNULL_END
