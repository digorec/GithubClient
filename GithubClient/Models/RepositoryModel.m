//
//  RepositoryModel.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import "RepositoryModel.h"

@implementation RepositoryModel : NSObject

- (instancetype)initWithDictionary: (NSDictionary *) dictionary
{
    self = [super init];
    if (self) {
        
        self.ID = [[dictionary objectForKey:@"id"] integerValue];
        self.name = [dictionary objectForKey:@"name"];
        self.textDescription = [dictionary objectForKey:@"description"];
        self.autor = [dictionary objectForKey:@"default_branch"];
        self.forck = [[dictionary objectForKey:@"forks_count"] integerValue];
        self.watch = [[dictionary objectForKey:@"watches_count"] integerValue];
        
        if (![self.textDescription isKindOfClass:[NSString class]]) {
            
            self.textDescription = @"This repository does not have a description";
        }
        
        self.privateRepository = [[dictionary objectForKey:@"private"] boolValue];
        
        NSDictionary *ownerDictionary = [dictionary objectForKey:@"owner"];
        
        self.login = [ownerDictionary objectForKey:@"login"];
        self.avatarURLString = [ownerDictionary objectForKey:@"avatar_url"];
        
        self.owner = [[UserModel alloc] initWithDictionary:ownerDictionary];
    }
    return self;
}

@end
