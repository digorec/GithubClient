//
//  UserModel.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import "UserModel.h"

@implementation UserModel

- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        
        self.ID = [[dictionary objectForKey:@"id"] integerValue];
        self.login = [dictionary objectForKey:@"login"];
        self.avatarURLString = [dictionary objectForKey:@"avatar_url"];
        
    }
    return self;
}

@end
