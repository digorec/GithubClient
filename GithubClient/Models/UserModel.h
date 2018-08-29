//
//  UserModel.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserModel : NSObject

@property (assign, nonatomic) NSUInteger ID;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *avatarURLString;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
