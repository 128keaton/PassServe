//
//  PassServe.m
//  Lucardio
//
//  Created by Keaton Burleson on 9/26/13.
//  Copyright (c) 2013 Keaton Burleson. All rights reserved.
//

#import "PassServe.h"
#import "AFNetworking.h"
@implementation PassServe


+ (void)downloadPassWithURL:(NSURL *)url passName:(NSString *)name webView:(UIWebView *)webView tableView:(UITableView *)tableView overwrite:(BOOL *)overwrite{
    NSError *error;
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    AFHTTPRequestOperation *operation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
     [[NSFileManager defaultManager] removeItemAtPath: name error: &error];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [[paths objectAtIndex:0] stringByAppendingPathComponent:name];
    operation.outputStream = [NSOutputStream outputStreamToFileAtPath:path append:NO];
 

    [operation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"Successfully downloaded file to %@", path);
        NSString *urlAddress = @"http://pass.keatonburleson.com/remove.php";
        
        //Create a URL object.
        NSURL *url3 = [NSURL URLWithString:urlAddress];
        
        //URL Requst Object
        NSURLRequest *requestObj = [NSURLRequest requestWithURL:url3];
        
        //Load the request in the UIWebView.
        [webView loadRequest:requestObj];
        NSLog(@"Success!");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
    }];
    
    [operation start];
    [tableView reloadData];

   
}

+ (void)generatePassWithURL:(NSString *)url argument:(NSString *)argument activityView:(UIActivityIndicatorView *)activityIndicator webView:(UIWebView *)webView{
    

    [activityIndicator startAnimating];
   
    NSString *urlAddress = [NSString stringWithFormat:@"%@%@", url, argument];
    NSLog(urlAddress);
    //Create a URL object.

    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:urlAddress]];
    
    //Load the request in the UIWebView.
    [webView loadRequest:requestObj];

    [activityIndicator stopAnimating];
    
 
}
@end
