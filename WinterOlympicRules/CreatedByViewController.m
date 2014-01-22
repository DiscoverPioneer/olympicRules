//
//  CreatedByViewController.m
//  WinterOlympicRules
//
//  Created by User on 1/22/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "CreatedByViewController.h"
#import "WebViewController.h"
@interface CreatedByViewController ()
- (IBAction)backButton:(id)sender;

@end

@implementation CreatedByViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    WebViewController *WVC = [segue destinationViewController];

    if ([segue.identifier isEqualToString:@"webView"]) {
        [WVC setURL:@"http://www.discoverPioneer.com"];
    }
    else if ([segue.identifier isEqualToString:@"webView2"]){
        [WVC setURL:@"http://www.UniversityPrimetime.com"];

    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backButton:(id)sender {
    
    [self dismissViewControllerAnimated:YES
                             completion:nil];
}

@end
