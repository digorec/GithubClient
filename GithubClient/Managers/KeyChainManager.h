//
//  KeyChainManager.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KeyChainManager : NSObject

+ (instancetype) sharedManager;
- (BOOL) saveToken: (NSString *) token;
- (NSString *) getToken;
- (BOOL) deleteToken;

@end
