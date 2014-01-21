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
        UIImage *backButtonImage = [[UIImage imageNamed:@"BackButton.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 13, 0, 6)];
        [self.navigationController.navigationItem.backBarButtonItem setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
        //[[UIBarButtonItem appearance]setBackButtonBackgroundImage:backButtonImage forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.detailLabel.text = self.nameString;
    completeString = [NSString stringWithFormat:@"Description:\n%@\n\nRules:\n%@",self.descriptionString,self.ruleString];

    self.textView.text=completeString;
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
