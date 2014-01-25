//
//  PDFViewer.h
//  WinterOlympicRules
//
//  Created by Phil Scarfi on 1/22/14.
//  Copyright (c) 2014 Pioneer Mobile Applications. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PDFViewer : UIViewController<UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

//<UIWebViewDelegate>
//@property (strong, nonatomic) IBOutlet UIWebView *webView;
//@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityIndicator;

@end
