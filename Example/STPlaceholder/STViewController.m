//
//  STViewController.m
//  STPlaceholder
//
//  Created by czqasngit on 04/10/2018.
//  Copyright (c) 2018 czqasngit. All rights reserved.
//

#import "STViewController.h"
#import "PVViewController.h"
#import "CollectionViewController.h"

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)table:(id)sender {
    PVViewController *c = [[PVViewController alloc] init] ;
    [self.navigationController pushViewController:c animated:YES] ;
}

- (IBAction)collection:(id)sender {
    CollectionViewController *c = [[CollectionViewController alloc] init] ;
    [self.navigationController pushViewController:c animated:YES] ;
}
@end
