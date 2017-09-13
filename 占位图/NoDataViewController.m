//
//  NoDataViewController.m
//  占位图
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "NoDataViewController.h"
#import "UITableView+HD_NoList.h"
#import "UIView+Extension.h"

@interface NoDataViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tabView;

@property(nonatomic,assign)int datas; //这是数据

@end

@implementation NoDataViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"没有数据得占位图";
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    
    //tableView
    self.tabView = [[UITableView alloc] init];
    self.tabView.frame = CGRectMake(0, 0, self.view.width, self.view.height);
    self.tabView.delegate = self;
    self.tabView.dataSource = self;
    self.tabView.tableFooterView = [[UIView alloc] init];
    
    [self.view addSubview:self.tabView];
    
    //网络请求
    [self quest];
    
    // Do any additional setup after loading the view.
}

#pragma mark -- 网络请求
- (void)quest
{
    self.datas = 0;
    [self.tabView reloadData];
    
    [self NeedResetNoView];
}

- (void)NeedResetNoView{
    if (self.datas>0) {
        [self.tabView dismissNoView];
    }else{
        [self.tabView showNoView:@"怎么没有数据那???" image:nil certer:CGPointZero];
        
    }
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
