//
//  UIViewController+Additions.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import "UIViewController+Additions.h"

@implementation UIViewController (Additions)

- (void) openNoConnectionAlert {
    
    [self openAlertWithTitle:@"Atention!"
                  andMessage:@"No connection to network! Check your settings!"];
}

- (void) openBadDataAlert {
    
    [self openAlertWithTitle:@"Atention!"
                  andMessage:@"Received bad data! Check your settings or try later!"];
}

- (void) openNoAuthorizedAlert {
    
    [self openAlertWithTitle:@"Atention!"
                  andMessage:@"You are not authorized! Please authorize in system!"];
}


- (void) openAlertWithTitle: (NSString *) title andMessage: (NSString *) message {
    
    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle: title
                                        message: message
                                 preferredStyle: UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction =
    [UIAlertAction actionWithTitle: @"Ok"
                             style: UIAlertActionStyleDefault
                           handler: nil];
    
    [alertController addAction: okAction];
    
    [self presentViewController: alertController animated: YES completion: nil];
}


@end
