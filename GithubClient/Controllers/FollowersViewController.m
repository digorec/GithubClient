//
//  RepositoriesViewController.m
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import "FollowersViewController.h"
#import "CustomTableView.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SVProgressHUD.h>

@interface FollowersViewController () <UITableViewDelegate, UITableViewDataSource> {
    NSArray *models;
}

@property (strong, nonatomic) NSArray *followers;
@property (strong, nonatomic) UserModel *user;
@property (strong, nonatomic) CustomTableView *tableView;


@end

@implementation FollowersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (self.user) {
        self.title = self.user.login;
    } else {
        self.title = @"octocat";
    }
    
    self.tableView = [[CustomTableView alloc] init];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    [self.tableView setTranslatesAutoresizingMaskIntoConstraints:NO];
    [[self.tableView.leadingAnchor constraintEqualToAnchor:self.view.leadingAnchor] setActive:YES];
    [[self.tableView.topAnchor constraintEqualToAnchor:self.view.topAnchor] setActive:YES];
    [[self.tableView.trailingAnchor constraintEqualToAnchor:self.view.trailingAnchor] setActive:YES];
    [[self.tableView.bottomAnchor constraintEqualToAnchor:self.view.bottomAnchor] setActive:YES];
    
    UIButton *loginButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 25, 25)];
    [loginButton setImage:[UIImage imageNamed:@"icons8-male-user-filled-50.png"] forState:UIControlStateNormal];
    [loginButton addTarget:self action:@selector(showLoginModule) forControlEvents:UIControlEventTouchUpInside];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:loginButton];
}

- (void) viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self.tableView setAllowsSelection:YES];
    
    if (models.count == 0) {
        [SVProgressHUD show];
    }

    [[NetworkManager sharedManager] startMonitoringExistConnection:^{
        [self getUserFollowers];
    } notExistConnection:^{
        [self openNoConnectionAlert];
    }];
}

- (void) viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [[NetworkManager sharedManager] stopMonitoringConnection];
}

- (void) getUserFollowers {
    
    [self startNetworkActivity];
    
    [[NetworkManager sharedManager] getFollowersOfUser:self.user.followersURLString completionHandler:^(NSArray *responseArray) {
        [self stopNetworkActivity];
        [self parseAndDisplayUserRepositories:responseArray];
        [SVProgressHUD dismiss];
    } failureHandler:^(NSError *error) {
        [self stopNetworkActivity];
        [self openBadDataAlert];
        [SVProgressHUD dismiss];
    }];

}

- (void) parseAndDisplayUserRepositories: (NSArray *) repositoriesArray {
    
    NSMutableArray *followers = [[NSMutableArray alloc] init];
    
    for (NSDictionary *dictionary in repositoriesArray) {
        
        UserModel *follower = [[UserModel alloc] initWithDictionary:dictionary];
        
        [followers addObject:follower];
    }
    
    self.followers = followers;
    
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.followers.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *identifier = @"userCell";
    
    UserCell *cell =[tableView dequeueReusableCellWithIdentifier:identifier];
    
    if(!cell){
        cell = [[UserCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    UserModel *follower = [self.followers objectAtIndex:indexPath.row];
    
    NSURL *imageURL = [NSURL URLWithString:follower.avatarURLString];

    cell.login.text = follower.login;
    
    [cell.avatarImageView sd_setImageWithURL:imageURL
                 placeholderImage:[UIImage imageNamed:@"placeholder.png"]];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    FollowersViewController *nextFollowersVC = [[FollowersViewController alloc] init];
    nextFollowersVC.user = self.followers[indexPath.row];
    [super showViewController:nextFollowersVC sender:nil];
}

- (void)showLoginModule
{
    UIViewController *loginModuleTabBarControllerl = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"LoginModuleTabBarControllerl"];
    [super showViewController:loginModuleTabBarControllerl sender:nil];
}




@end
