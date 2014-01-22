//
//  WebViewController.m
//  WinterOlympicRules
//
//  Created by User on 1/22/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;
- (IBAction)returnButton:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;
@end

@implementation WebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        self.webView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

   
    
    /*NSURL *webSite;
    NSString *webSiteUrlString;
    webSiteUrlString=[[NSString alloc]initWithFormat:@"http://www.discoverPioneer.com"];
    webSite=[[NSURL alloc]initWithString:webSiteUrlString];
    [self.webView loadRequest:[NSURLRequest requestWithURL:webSite]];*/
   
}

- (void)viewWillAppear:(BOOL)animated{
    
    self.webView.backgroundColor = [UIColor clearColor];
    [self.webView setOpaque:NO];
    [self.webView setScalesPageToFit:YES];
    
    //NSString *fullURL = @"http://www.discoverPioneer.com";
    NSString *fullURL = self.URL;
    NSURL *url = [NSURL URLWithString:fullURL];
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [self.webView loadRequest:request];

}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.activityIndicator startAnimating];

}//a web view starts loading

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityIndicator stopAnimating];
    
}//web view finishes loading

- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error
{
    [self.activityIndicator stopAnimating];
    NSLog(@"failed to connect to internet");

}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)returnButton:(id)sender {
    
    [self
     dismissViewControllerAnimated:YES completion:nil];
}
@end
