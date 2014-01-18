//
//  ViewController.h
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UITableViewController<UISearchBarDelegate,UISearchDisplayDelegate>


@property (strong,nonatomic) NSMutableArray *filteredArray;
@property (strong, nonatomic) IBOutlet UISearchBar *sportSearchBar;

@end
