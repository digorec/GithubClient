//
//  ParentViewController.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NetworkManager.h"
#import "KeyChainManager.h"

#import <SDWebImage/UIImageView+WebCache.h>
#import "UIViewController+Additions.h"

#import "UserModel.h"
#import "RepositoryModel.h"

@interface ParentViewController : UIViewController

- (void) startNetworkActivity;
- (void) stopNetworkActivity;

@end
