//
//  ViewController.m
//  WDRacDemo
//
//  Created by 蒋伟东 on 2021/6/3.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIView    *topItemBackView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    
    [self.view addSubview:self.topItemBackView];
    self.topItemBackView.backgroundColor = [UIColor redColor];
    self.topItemBackView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 500);
    
    [self initSubViews];
}

- (void)initSubViews {
    UIButton *btn_1 = [[UIButton alloc] init];
    [btn_1 setTitle:@"btn_1" forState:UIControlStateNormal];
    
    UIButton *btn_2 = [[UIButton alloc] init];
    [btn_2 setTitle:@"btn_2" forState:UIControlStateNormal];
    
    UIButton *btn_3 = [[UIButton alloc] init];
    [btn_3 setTitle:@"btn_3" forState:UIControlStateNormal];
    
    UIButton *btn_4 = [[UIButton alloc] init];
    [btn_4 setTitle:@"btn_4" forState:UIControlStateNormal];
    
    UIButton *btn_5 = [[UIButton alloc] init];
    [btn_5 setTitle:@"btn_5" forState:UIControlStateNormal];
    
    UIButton *btn_6 = [[UIButton alloc] init];
    [btn_6 setTitle:@"btn_6" forState:UIControlStateNormal];
    
    NSMutableArray *array = [[NSMutableArray alloc] init];
    [array addObject:btn_1];
    [array addObject:btn_2];
    [array addObject:btn_3];
    [array addObject:btn_4];
    [array addObject:btn_5];
    [array addObject:btn_6];
    
    [self setShareTopViewData:[array copy]];

}

- (void)setShareTopViewData:(NSArray *)topViewDataArray {
    
    NSInteger listMaxCount = 5;
    CGFloat pluginVerticalMaign = 30;
    CGFloat pluginHeight = 60;
    CGFloat pluginWidth = 60;

    for (int i = 0; i < topViewDataArray.count; i++) {
        UIButton *plugin = [topViewDataArray objectAtIndex:i];
        [plugin addTarget:self action:@selector(pluginDid:) forControlEvents:UIControlEventTouchUpInside];

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
