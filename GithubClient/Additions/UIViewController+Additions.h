//
//  UIViewController+Additions.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (Additions)

- (void) openNoConnectionAlert;
- (void) openBadDataAlert;
- (void) openNoAuthorizedAlert;
- (void) openAlertWithTitle: (NSString *) title andMessage: (NSString *) message;

@end
