//
//  JustFlickrPostedTVC.m
//  Shutterbug
//
//  Created by Inna Labuns'ka on 09.06.15.
//  Copyright (c) 2015 Inna Labuns'ka. All rights reserved.
//

#import "JustFlickrPostedTVC.h"

@interface JustFlickrPostedTVC ()

@end

@implementation JustFlickrPostedTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self fetchPhotos];
}

- (void)fetchPhotos
{
    NSURL *url = [FlickrFetcher URLforRecentGeoreferencedPhotos];
    NSData *jsonResult = [NSData dataWithContentsOfURL:url];
    NSDictionary *propertyListResult = [NSJSONSerialization JSONObjectWithData:jsonResult options:0 error:NULL];
    NSLog(@"Flickr results = %@",propertyListResult );
    NSArray *photos = [propertyListResult valueForKeyPath:FLICKR_RESULTS_PHOTOS];
    self.photos = photos;
    //self.photos = nil;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
