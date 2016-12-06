//
//  ViewController.m
//  ShangChengApp
//
//  Created by 俞乃胜 on 16/11/25.
//  Copyright © 2016年 俞乃胜. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "TherdViewController.h"
@interface ViewController ()
@property (nonatomic,strong)NSArray *ImgNameArray;

@end

@implementation ViewController
-(NSArray *)ImgNameArray{
    if (!_ImgNameArray)
    {
        _ImgNameArray =[[NSArray alloc]initWithObjects:@"3_",@"3",@"2_",@"2",@"1_",@"1",nil];
    }
    return _ImgNameArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor =[UIColor orangeColor];
    UIButton *but =[[UIButton alloc]initWithFrame:self.view.bounds];
    [but addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:but];
    
    NSString *httpurl =@"http://mudu.jianxinnet.com/activity.php?app=list";
    NSDictionary *dic =@{@"logins":@"8365EB05-608F-4CDA-BC13-87D8C6A22BDB",@"uid":@"2",@"uzb":@"31.364506|120.720227",@"zid":@"0"};
    [AFNetRequest HttpGetCallBack:httpurl Parameters:dic success:^(id responseObject) {
        DLog(@"responseObject%@",responseObject);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
    
    
    
}





- (void)click{
    UIWindow *window =[[UIApplication sharedApplication].delegate window];
    
    FirstViewController *firstVC =[[FirstViewController alloc]init];
    firstVC.title =@"first";
    firstVC.tabBarItem.tag =101;
    [self creatTabBarWith:firstVC];
    UINavigationController *firstNav =[[UINavigationController alloc]initWithRootViewController:firstVC];
    
    SecondViewController *secondVC = [[SecondViewController alloc]init];
    secondVC.title =@"second";
    secondVC.tabBarItem.tag =102;
    [self creatTabBarWith:secondVC];
    UINavigationController *secondNav =[[UINavigationController alloc]initWithRootViewController:secondVC];
    
    TherdViewController *therdVC =[[TherdViewController alloc]init];
    therdVC.title =@"therd";
    UINavigationController *therdNav =[[UINavigationController alloc]initWithRootViewController:therdVC];
    
    
    
    UITabBarController *tabBar =[[UITabBarController alloc]init];
    tabBar.viewControllers =@[firstNav,secondNav,therdNav];
    window.rootViewController =tabBar;
}
#pragma mark --创建tabbar的子ViewController
-(void)creatTabBarWith:(UIViewController *)controller
{
    //[controller.tabBarItem setTitlePositionAdjustment:UIOffsetMake(0, -3)];
    [controller.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor blackColor],NSForegroundColorAttributeName,nil] forState:UIControlStateSelected];
    UIImage *img =[[UIImage imageNamed:self.ImgNameArray[(controller.tabBarItem.tag-101)*2]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.image =img;
    
    UIImage *selct =[[UIImage imageNamed:self.ImgNameArray[(controller.tabBarItem.tag-101)*2+1]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    controller.tabBarItem.selectedImage= selct;
    
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
