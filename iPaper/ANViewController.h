//
//  ANViewController.h
//  iPaper
//
//  Created by Avinash Nehra on 10/9/13.
//  Copyright (c) 2013 Avinash Nehra. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ANViewController : UIViewController

@property (strong, nonatomic) UITableView *firstImage;
@property (retain, nonatomic) UILabel *imageTitle;
@property (strong, nonatomic) UIButton *addLinkButton;

-(UIView *) navigationTitleView;

@end
