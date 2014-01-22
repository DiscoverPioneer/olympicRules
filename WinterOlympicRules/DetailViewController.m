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
        // Custom initialization
        //Set BackButton Background
        //UIImage *backButtonImage = [[UIImage imageNamed:@"BackButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
        //[self.navigationController.navigationItem.backBarButtonItem setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //[[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.detailLabel.text = self.nameString;
    completeString = [NSString stringWithFormat:@"                              Description:\n%@\n\n                                   Rules:\n%@",self.descriptionString,self.ruleString];
   
    //UIFont *italic = [UIFont italicSystemFontOfSize:14.0f];
    //UIFont *boldItalic = [UIFont fontWithName:@"Trebuchet-BoldItalic" size:14];
    UIFont *boldItalic = [UIFont fontWithName:@"Arial-BoldItalicMT" size:14];
    //UIFont *otherItalic = [UIFont italicSystemFontOfSize:12.0];
    NSMutableAttributedString *mutable = [[NSMutableAttributedString alloc] initWithString:completeString];
    [mutable addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"ArialMT" size:14] range:[completeString rangeOfString:completeString]];
    
    [mutable addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed: 32.0/255.0f green:70.0/255.0f blue:175.0/255.0f alpha:1.0] range:[completeString rangeOfString:completeString]];
    
    
    NSArray *headers;
    headers = @[@"Rules:", @"Equipment:", @"Description:", @"Equipment:", @"Dates:", @"Procedure:", @"Scoring:"];
    for (NSString *string in headers) {
        [mutable addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Arial-BoldMT" size:14] range:[completeString rangeOfString:string]];
        //[mutable addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:14] range:[completeString rangeOfString:string]];
    }
    
// Adding bullets to string
    NSString *bullet = @"•";
    //NSRange bulletText = [completeString rangeOfString:bullet];
    //[mutable addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed: 150.0/255.0f green:70.0/255.0f blue:140.0/255.0f alpha:1.0] range:bulletText];
    UIColor * bulletColor = [UIColor colorWithRed:0.0/255.0f green:70.0/255.0f blue:150.0/255.0f alpha:0.85];
    
    NSUInteger count = 0, length = [completeString length];
    NSRange range = NSMakeRange(0, length);
    
    while(range.location != NSNotFound)
    {
        range = [completeString rangeOfString:bullet options:0 range:range];
        if(range.location != NSNotFound) {
            [mutable addAttribute:NSForegroundColorAttributeName value:bulletColor range:NSMakeRange(range.location, [bullet length])];
            range = NSMakeRange(range.location + range.length, length - (range.location + range.length));
            count++;
        }
    }
    
  //End adding bullets
        
    
    [mutable addAttribute:NSFontAttributeName value:boldItalic range:[completeString rangeOfString:@"sled   "]];

    /*[mutable addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"HelveticaNeue-Bold" size:12] range:[completeString rangeOfString:@"Scoring:"]];*/
    
    
    
    [self.textView setTintColor:[UIColor lightTextColor]];
    self.textView.textAlignment = NSTextAlignmentJustified;

    [self.textView setAttributedText:mutable];
    //self.textView.text=bulletList;
    
    

   
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
