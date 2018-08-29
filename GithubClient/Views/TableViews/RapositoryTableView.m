//
//  RapositoryTableView.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import "RapositoryTableView.h"

@implementation RapositoryTableView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        
        self.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 60.f;
        
        UINib *nib = [UINib nibWithNibName:@"RepositoryCell" bundle:nil];
        [self registerNib:nib forCellReuseIdentifier:@"repositoryCell"];
    }
    return self;
}


@end
