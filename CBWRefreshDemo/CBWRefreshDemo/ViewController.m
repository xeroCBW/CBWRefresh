//
//  ViewController.m
//  CBWRefreshDemo
//
//  Created by 陈博文 on 16/6/14.
//  Copyright © 2016年 陈博文. All rights reserved.
//

#import "ViewController.h"
#import "CBWRefresh.h"

@interface ViewController ()
/** 数据源*/
@property (nonatomic ,strong) NSMutableArray *array;
/** 计数器*/
@property (nonatomic ,assign) int count;

/** 获取最新数据索引*/
@property (nonatomic ,assign) int topIndex;
/** 获取更多数据索引*/
@property (nonatomic ,assign) int bottomIndex;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.title = @"CBWRefresh";
    
    self.tableView.rowHeight = 20;
    self.count = 1;
    self.topIndex = 1;
    self.bottomIndex = 1;
    
    [self CBWHeaderRefresh];
    
    [self CBWFooterRefresh];

    self.tableView.tableFooterView = [[UIView alloc]init];
}



#pragma mark - CBWRefresh
#pragma mark - 上拉刷新
- (void)CBWHeaderRefresh{
    self.tableView.header  = [CBWActivityViewHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.header beginRefresh];
}
- (void)loadNewData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        
        for (int i = 0; i < 10; i ++) {
            
            NSString *str =  [NSString stringWithFormat:@"%zd---往前增加的%d",self.topIndex,i];
            [self.array insertObject:str atIndex:0];
        }
        
        
        [self.tableView reloadData];
        [self.tableView.header endRefresh];
        
          
        //重置没有数据
//        [self resetNoMoreData];
        
        self.topIndex ++;
    });
    
}
#pragma mark - 下拉刷新
- (void)CBWFooterRefresh{
    
    self.tableView.footer  = [CBWActivityViewFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
}


- (void)loadMoreData{
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //没有更多数据了,直接显示没有更多数据状态
        if (self.count >= 3) {
            [self.tableView.footer endRefreshingWithNoMoreData];
            return ;
        }
        
        for (int i = 0; i < 10; i ++) {
            
            NSString *str =  [NSString stringWithFormat:@"%zd++++往后增加的%d",self.bottomIndex,i];
            [self.array addObject:str];
        }
        
        [self.tableView reloadData];
        [self.tableView.footer endRefresh];
        
        self.count ++;
        self.bottomIndex ++;
    });
}

/**
 *  footer 重置没有数据
 */
- (void)resetNoMoreData{
    
    [self.tableView.footer resetNoMoreData];
}
#pragma mark - datasource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.array.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc]init];
    cell.textLabel.text = self.array[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewController *tableViewController = [[UITableViewController alloc]init];
    tableViewController.view.backgroundColor = [UIColor redColor];
    [self.navigationController pushViewController:tableViewController animated:YES];
    
}

#pragma mark - 数据源

- (NSMutableArray *)array{
    
    if (_array == nil) {
        _array = [NSMutableArray array];
    }
    return _array;
}



@end
