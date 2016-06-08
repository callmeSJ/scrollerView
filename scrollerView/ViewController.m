//
//  ViewController.m
//  scrollerView
//
//  Created by SJ on 16/6/7.
//  Copyright © 2016年 SJ. All rights reserved.
//

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>

@property(nonatomic,strong)UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createScrollView];
}

-(void)createScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KScreenWidth, KScreenHeight)];
    //代理
    _scrollView.delegate = self;
    //垂直方向滚动
    _scrollView.showsVerticalScrollIndicator = YES;
    //横向滚动
    _scrollView.showsHorizontalScrollIndicator = NO;
    //滑动的范围
    _scrollView.contentSize = CGSizeMake(KScreenWidth, 2000);
    //是否回弹
    _scrollView.bounces = YES;
    
    _scrollView.pagingEnabled = NO;
    [self.view addSubview:_scrollView];
    
    for(int i = 0 ; i < 10 ; i++){
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 150*i, KScreenWidth, 140)];
        view.backgroundColor = [UIColor colorWithRed:arc4random()%256/255.0f green:arc4random()%256/255.0f blue:arc4random()%256/255.0f alpha:0.9];
        [_scrollView addSubview:view];
        
    }
}
//查看偏移量
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"scrollView的偏移量 x = %f,y = %f",_scrollView.contentOffset.x,_scrollView.contentOffset.y);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
