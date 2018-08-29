//
//  RepositoryTableView.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import "CustomTableView.h"

@implementation CustomTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 60.f;
        
        UINib *nib1 = [UINib nibWithNibName:@"RepositoryCell" bundle:nil];
        [self registerNib:nib1 forCellReuseIdentifier:@"repositoryCell"];
        
        UINib *nib2 = [UINib nibWithNibName:@"UserCell" bundle:nil];
        [self registerNib:nib2 forCellReuseIdentifier:@"userCell"];
    }
    return self;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 60.f;
        
        UINib *nib1 = [UINib nibWithNibName:@"RepositoryCell" bundle:nil];
        [self registerNib:nib1 forCellReuseIdentifier:@"repositoryCell"];
        
        UINib *nib2 = [UINib nibWithNibName:@"UserCell" bundle:nil];
        [self registerNib:nib2 forCellReuseIdentifier:@"userCell"];
    }
    return self;
}


@end
