//
//  LoginButton.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import "LoginButton.h"

@implementation LoginButton

- (void) setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    
    if (enabled) {
        
        self.backgroundColor = [UIColor orangeColor];
        
    } else {
        
        self.backgroundColor = [UIColor lightGrayColor];
    }
}

@end
