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
            }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    self.scrollView.minimumZoomScale=0.5;
    
    self.scrollView.maximumZoomScale=6.0;
    
    [scrollView setContentSize:CGSizeMake(imageView.image.size.width, imageView.image.size.height)];
    
    self.scrollView.delegate=self;
	    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
