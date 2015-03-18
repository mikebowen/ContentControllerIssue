//
//  ViewController.m
//  ContentController
//
//  Created by Bowen, Mike on 3/17/15.
//  Copyright (c) 2015 Mike Bowen. All rights reserved.
//

#import "ViewController.h"
#import "MapViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL mapShown;
@property (nonatomic, strong) MapViewController *mapViewController;
@property (nonatomic, strong) TableViewController *tableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Switch" style:UIBarButtonItemStylePlain target:self action:@selector(switchViewControllers:)];
    self.navigationItem.rightBarButtonItem = barButtonItem;
 
    self.mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
    self.tableViewController = [[TableViewController alloc] initWithNibName:nil bundle:nil];
    
    

    /* !!! SWITCH THIS VALUE FROM YES<->NO TO SEE DIFFERENT TABLE VIEW BEHAVIOR !!! */
    BOOL startWithMap = YES;
    
    if (startWithMap)
    {
        [self displayContentController:self.mapViewController];
        self.mapShown = startWithMap;
    }
    else
    {
        [self displayContentController:self.tableViewController];
        self.mapShown = startWithMap;
    }
    
    self.mapShown = startWithMap;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) displayContentController: (UIViewController*) content;
{
    [self addChildViewController:content];                 // 1
    content.view.frame = [self frameForContentController]; // 2
    [self.view addSubview:content.view];
    [content didMoveToParentViewController:self];          // 3
}


- (void) hideContentController: (UIViewController*) content
{
    [content willMoveToParentViewController:nil];  // 1
    [content.view removeFromSuperview];            // 2
    [content removeFromParentViewController];      // 3
}

- (CGRect)frameForContentController
{
    return self.contentController.bounds;
}

- (void)switchViewControllers:(id)sender
{
    if (self.mapShown) {
        [self hideContentController:self.mapViewController];
        [self displayContentController:self.tableViewController];
    } else {
        [self hideContentController:self.tableViewController];
        [self displayContentController:self.mapViewController];
    }
    self.mapShown = !self.mapShown;
}


@end
