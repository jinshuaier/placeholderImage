//
//  NoNetWorkViewController.m
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "NoNetWorkViewController.h"
#import "HggNoNetworkView.h"
#import "UIView+Extension.h"
#import "FileManager.h"
#import "SVProgressHUD.h"

@interface NoNetWorkViewController ()<CheckNetworkDelegate,UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabView;
@property(nonatomic,assign)int datas; //这是数据

@end

@implementation NoNetWorkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"没有网络的占位图";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    FileManager *maa = [FileManager shareFileManager];
    if (maa.netState == 1 || maa.netState == 2){
        
        self.tabView = [[UITableView alloc] init];
        self.tabView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
        self.tabView.delegate = self;
        self.tabView.dataSource = self;
        self.tabView.tableFooterView = [[UIView alloc] init];
        
        [self.view addSubview:self.tabView];
        
        self.datas = 20;
    }
    else
    {
            HggNoNetworkView *noNetworkView = [[HggNoNetworkView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
            noNetworkView.delegate = self;
            [self.view addSubview:noNetworkView];
    }


    // Do any additional setup after loading the view.
}
#pragma mark - UITableViewDataSource
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datas;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cellid"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellid"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld行",indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    
    
    NSLog(@"%ld",indexPath.row);
}

- (void)reloadData
{
    [SVProgressHUD showWithStatus:@"没网"];
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
