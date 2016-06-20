# CBWRefresh
CBWRefreshDemo自己写的 refresh

contensize 小于 frame 的情况, footer 默认放在屏幕frame 的底部
####install
1. 使用 pod 'CBWRefresh'
2. 直接拖 CBWRefresh 文件夹

####usage

#####1.header

```
self.tableView.header  = [CBWActivityViewHeader headerWithRefreshingTarget:self refreshingAction:@selector(loadNewData)];
    [self.tableView.header beginRefresh];

```
```

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
```

#####2.footer

```
 self.tableView.footer  = [CBWActivityViewFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
```

```
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

```

