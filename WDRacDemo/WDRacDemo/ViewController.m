//
//  ViewController.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/3.
//

#import "ViewController.h"
#import "WDFirstViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView    *topItemBackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.topItemBackView];
    self.topItemBackView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 500);
    
    [self setShareTopViewData];
}

- (void)setShareTopViewData {
    
    NSInteger listMaxCount = 5;
    CGFloat pluginVerticalMaign = 30;
    CGFloat pluginHeight = 60;
    CGFloat pluginWidth = 60;

    for (int i = 0; i < 8; i++) {
        UIButton *plugin = [[UIButton alloc] init];
        [plugin setTitle:[NSString stringWithFormat:@"btn_%d",i] forState:UIControlStateNormal];
        [plugin addTarget:self action:@selector(pluginDid:) forControlEvents:UIControlEventTouchUpInside];
        [plugin setBackgroundColor:[UIColor greenColor]];
        plugin.tag = i;
        [self.topItemBackView addSubview:plugin];
        NSInteger list_i =  i % listMaxCount; // 列
        NSInteger row_i = i / listMaxCount; // 行号
        // 按钮的 y坐标
        NSInteger plugin_y =  row_i * (pluginHeight + pluginVerticalMaign);
        //  x坐标
        CGFloat p_1_x = ([UIScreen mainScreen].bounds.size.width - listMaxCount * pluginWidth)/(listMaxCount+1);
        CGFloat plugin_x = p_1_x + list_i*(pluginWidth + p_1_x);
        plugin.frame = CGRectMake(plugin_x, plugin_y, pluginWidth, pluginHeight);
    }
}

- (void)pluginDid:(UIButton *)btn {
    NSLog(@"pluginDid tag:%ld",(long)btn.tag);
    switch (btn.tag) {
        case 0:
        {
            WDFirstViewController *vc = [[WDFirstViewController alloc] init];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            
        }
            break;
        case 2:
        {
            
        }
            break;
        case 3:
        {
            
        }
            break;
        case 4:
        {
            
        }
            break;
        case 5:
        {
            
        }
            break;
            
        default:
            break;
    }
}

- (UIView *)topItemBackView {
    if (!_topItemBackView) {
        _topItemBackView = [[UIView alloc] init];
    }
    return _topItemBackView;
}
@end
