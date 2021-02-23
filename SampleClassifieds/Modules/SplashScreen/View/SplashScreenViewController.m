//
//  SplashScreenViewController.m
//  SampleClassifieds
//
//  Created by Zulqurnain on 22/02/2021.
//

#import "SplashScreenViewController.h"

@interface SplashScreenViewController ()

@end

@implementation SplashScreenViewController

const int delay = 1.0;

- (void)viewDidLoad {
    [super viewDidLoad];

    [self segueToListView];
}

- (void)segueToListView {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, delay * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        [self performSegueWithIdentifier:@"segueToListView" sender:self];
    });
}

@end
