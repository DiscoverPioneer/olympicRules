//
//  PDFViewer.m
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/22/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import "PDFViewer.h"

@interface PDFViewer ()

@end

@implementation PDFViewer

@synthesize scrollView, imageView;


-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return imageView;
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.webView.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.scrollView.minimumZoomScale=0.5;
    
    self.scrollView.maximumZoomScale=6.0;
    
    [scrollView setContentSize:CGSizeMake(imageView.image.size.width, imageView.image.size.height)];
    
    //self.scrollView.contentSize=CGSizeMake(1280, 960);
    
    self.scrollView.delegate=self;
	    
    
}



//-(void)viewDidAppear:(BOOL)animated{
   // @try {
        // replace "test" with the name of your pdf. do not include the extension!
       /* NSString *path = [[NSBundle mainBundle] pathForResource:@"WO calander" ofType:@"png"];
        // this takes the path and turns it into a url our webview can load
        NSURL *url = [NSURL fileURLWithPath:path];
        // create the request
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        // load the request
        [self.webView loadRequest:request];
        // make it full size
        self.webView.scalesPageToFit = YES;*/
        
        
   /* }
    @catch (NSException *exception) {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Sorry Could not load schedule" delegate:Nil cancelButtonTitle:@"Ok" otherButtonTitles: nil];
        [alert show];
    }*/
/*}
- (void)webViewDidStartLoad:(UIWebView *)webView{
    
    [self.activityIndicator startAnimating];
    
}//a web view starts loading

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    
    [self.activityIndicator stopAnimating];
    
}//web view finishes loading

- (void)webView:(UIWebView *)wv didFailLoadWithError:(NSError *)error
{
    [self.activityIndicator stopAnimating];
    NSLog(@"failed to connect to internet\n%@",error);
    
}*/
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
