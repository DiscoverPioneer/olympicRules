//
//  DetailViewController.h
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong,nonatomic)NSString *ruleString;
@property (strong,nonatomic)NSString *descriptionString;
@property (strong,nonatomic)NSString *nameString;

@property (strong, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) IBOutlet UILabel *detailLabel;

- (NSMutableAttributedString*) setColor:(UIColor*)color word:(NSString*)word inText:(NSMutableAttributedString*)mutableAttributedString;
@end
