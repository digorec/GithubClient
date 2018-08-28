//
//  RepositoryModel.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2017 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"

@interface RepositoryModel : NSObject

@property (assign, nonatomic) NSUInteger ID;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *textDescription;
@property (strong, nonatomic) NSString *autor;
@property (assign, nonatomic) NSUInteger forck;
@property (assign, nonatomic) NSUInteger watch;
@property (strong, nonatomic) NSString *login;
@property (strong, nonatomic) NSString *avatarURLString;

@property (assign, nonatomic) BOOL privateRepository;

@property (strong, nonatomic) UserModel *owner;

- (instancetype)initWithDictionary: (NSDictionary *) dictionary;

@end
