//
//  EventsViewController.h
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EventsViewController : UIViewController
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong,nonatomic) NSDictionary *events;

@end
