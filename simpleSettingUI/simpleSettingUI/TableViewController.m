//
//  TableViewController.m
//  simpleSettingUI
//
//  Created by wutao on 2017/8/19.
//  Copyright © 2017年 wutao. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
#import "constant.h"


@interface TableViewController (){
    
    UIImageView* tableheadView;
    
    UIButton* userImageButton;
    
    
    
    CGFloat tableviewHerderOriginY;
    
    CGFloat tableviewHeaderHeight;
    
    CGFloat userImageViewHeight;
    
    NSArray* dataSource;
}

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    dataSource = @[
                   @[@{@"title":@"个人收藏",@"image":@"MoreMyFavorites"}],
                   @[@{@"title":@"我的银行卡",@"image":@"MoreMyBankCard"},@{@"title":@"我的游戏",@"image":@"MoreGame"}],
                   @[@{@"title":@"系统设置",@"image":@"MoreSetting"},@{@"title":@"我的卡包",@"image":@"MyCardPackageIcon"}]
                   ];
    
    
    // 去掉tableView底部多余的表格线
    [self.tableView setTableFooterView:[[UIView alloc] initWithFrame:CGRectZero]];
    
    
    self.automaticallyAdjustsScrollViewInsets =NO;
    
    
    [self.tableView setSeparatorColor:kCuttingLineColor];
    
    tableheadView= [[UIImageView alloc ]init];
    tableheadView.backgroundColor = kTableHeaderBgColor;
    
    userImageButton = [[UIButton alloc]init];
    
    
    userImageButton.layer.masksToBounds=YES;
    [userImageButton setBackgroundImage:[UIImage imageNamed:@"mayun"] forState:UIControlStateNormal];
    [tableheadView addSubview:userImageButton];
    
    self.tableView.tableHeaderView   =  [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, kInitHeaderViewHeight)];
    
    tableviewHerderOriginY = kInitHeaderViewOriginY;
    
    tableviewHeaderHeight = kInitHeaderViewHeight;
    
    userImageViewHeight = kInitUserImageViewHeight;
    
    [self.tableView addSubview:tableheadView];

}
- (void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
    tableheadView.frame = CGRectMake(0, tableviewHerderOriginY, [UIScreen mainScreen].bounds.size.width, tableviewHeaderHeight);
    userImageButton.frame =CGRectMake(0, 0, userImageViewHeight, userImageViewHeight);
    
    userImageButton.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2, (kInitHeaderViewHeight - kInitUserImageViewHeight) / 2 + userImageViewHeight / 2);
    
    
    userImageButton.layer.cornerRadius = userImageViewHeight / 2;
    
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    if(scrollView.contentOffset.y < 0) {
        CGFloat offsetY = (scrollView.contentOffset.y + scrollView.contentInset.top) * -1;
        tableviewHerderOriginY = kInitHeaderViewOriginY + -1 *offsetY;
        tableviewHeaderHeight = kInitHeaderViewHeight + offsetY;
        
        userImageViewHeight = kInitUserImageViewHeight + offsetY;
        
    }
    else {
        
        [scrollView setContentOffset: CGPointMake(0, 0)];
        
    }
}



#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return dataSource.count;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    NSArray* arr = dataSource[section];
    return arr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *CellIdentifier = @"CCMeTableViewCell";
    
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil)
    {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"TableViewCell" owner:self options:nil] firstObject];
    }
    [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
    
    cell.theImageView.image = [UIImage imageNamed:dataSource[indexPath.section][indexPath.row][@"image"]];
    cell.theTitleLabel.text = dataSource[indexPath.section][indexPath.row][@"title"];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001f;
}




@end
