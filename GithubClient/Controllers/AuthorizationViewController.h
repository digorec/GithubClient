//
//  AuthorizationViewController.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ParentViewController.h"

@protocol AuthorizationViewControllerDelegate;

@interface AuthorizationViewController : ParentViewController

@property (weak, nonatomic) id < AuthorizationViewControllerDelegate > delegate;

@end

@protocol AuthorizationViewControllerDelegate

@required

- (void) authorizationViewController: (AuthorizationViewController *) authorizationViewController userToken: (NSString *) token;

@end
