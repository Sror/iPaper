//
//  ANViewListController.h
//  iPaper
//
//  Created by Avinash Nehra on 10/11/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANViewListController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSString *selectedNewsCategory;
@property (strong, nonatomic) UITableView *table;

@end
