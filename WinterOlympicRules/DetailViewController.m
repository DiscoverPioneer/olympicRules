//
//  DetailViewController.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/17/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController (){
    NSString *completeString;
}

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
          }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.detailLabel.backgroundColor = [UIColor clearColor];
    self.detailLabel.opaque=NO;
    self.detailLabel.text = self.nameString;
    
    if ([self.ruleString length] >0) {
        completeString = [NSString stringWithFormat:@"                           Description:\n%@\n\n                          Competition:\n%@",self.descriptionString,self.ruleString];
    }else{
        
        completeString = [NSString stringWithFormat:@"                           Description:\n%@\n",self.descriptionString];
    }
        
     UIFont *boldItalic = [UIFont fontWithName:@"Arial-BoldItalicMT" size:15];
   
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] initWithString:completeString];
    [mutable addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"ArialMT" size:15] range:[completeString rangeOfString:completeString]];
    
     [mutable addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:[completeString rangeOfString:completeString]];
    
    
    NSArray *headers;
    headers = @[@"Date:",@"Individual Events:",@"Team Events:",@"Qualifying Heats:",@"Finals:",@"Medal Round:",@"Relay Setup:",@"Disqualification:",@"Sled:",@"Competition:", @"Equipment:", @"Description:", @"Equipment:", @"Dates:", @"Procedure:", @"Scoring:"];
    for (NSString *string in headers) {
        [mutable addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:15] range:[completeString rangeOfString:string]];
          }
    
// Adding bullets to string
    NSString *bullet = @"•";
    
    NSUInteger count = 0, length = [completeString length];
    NSRange range = NSMakeRange(0, length);
    
    while(range.location != NSNotFound)
    {
        range = [completeString rangeOfString:bullet options:0 range:range];
        if(range.location != NSNotFound) {
            [mutable addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(range.location, [bullet length])];
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
        }
    }
    
  //End adding bullets
   
    [mutable addAttribute:NSFontAttributeName value:boldItalic range:[completeString rangeOfString:@"sled   "]];
    
    [self.textView setTintColor:[UIColor lightTextColor]];
    self.textView.textAlignment = NSTextAlignmentJustified;

    [self.textView setAttributedText:mutable];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
