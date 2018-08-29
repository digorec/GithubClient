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
        self.followersURLString = [dictionary objectForKey:@"followers_url"];
    }
    return self;
}

@end

/*

 {
 "avatar_url" = "https://avatars2.githubusercontent.com/u/1555350?v=4";
 "events_url" = "https://api.github.com/users/myhduck/events{/privacy}";
 "followers_url" = "https://api.github.com/users/myhduck/followers";
 "following_url" = "https://api.github.com/users/myhduck/following{/other_user}";
 "gists_url" = "https://api.github.com/users/myhduck/gists{/gist_id}";
 "gravatar_id" = "";
 "html_url" = "https://github.com/myhduck";
 id = 1555350;
 login = myhduck;
 "node_id" = "MDQ6VXNlcjE1NTUzNTA=";
 "organizations_url" = "https://api.github.com/users/myhduck/orgs";
 "received_events_url" = "https://api.github.com/users/myhduck/received_events";
 "repos_url" = "https://api.github.com/users/myhduck/repos";
 "site_admin" = 0;
 "starred_url" = "https://api.github.com/users/myhduck/starred{/owner}{/repo}";
 "subscriptions_url" = "https://api.github.com/users/myhduck/subscriptions";
 type = User;
 url = "https://api.github.com/users/myhduck";
 }
 
*/
