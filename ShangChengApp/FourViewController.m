//
//  FourViewController.m
//  ShangChengApp
//
//  Created by 俞乃胜 on 16/11/30.
//  Copyright © 2016年 俞乃胜. All rights reserved.
//

#import "FourViewController.h"

@interface FourViewController ()

@end

@implementation FourViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *httpurl =@"http://mudu.jianxinnet.com/activity.php?app=list";
    NSDictionary *dic =@{@"logins":@"8365EB05-608F-4CDA-BC13-87D8C6A22BDB",@"uid":@"2",@"uzb":@"31.364506|120.720227",@"zid":@"0"};
    [AFNetRequest HttpGetCallBack:httpurl Parameters:dic success:^(id responseObject) {
        DLog(@"responseObject%@",responseObject);
    } failure:^(NSError *error) {
        [SVProgressHUD showErrorWithStatus:@"网络错误"];
    }];
    UIButton *but =[[UIButton alloc]initWithFrame:self.view.bounds];
    [self.view addSubview:but];
    
}
- (void)dealloc{
    DLog(@"释放了");
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
