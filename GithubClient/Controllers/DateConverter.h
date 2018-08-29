//
//  DateConverter.h
//  GithubClient
//
//  Created by Artem Lytkin on 28.08.18.
//  Copyright © 2018 Artem. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateConverter : NSObject

@property (copy, nonatomic) NSString *date;

- (NSString*)convertToDateWithDayMonthYear;

@end
