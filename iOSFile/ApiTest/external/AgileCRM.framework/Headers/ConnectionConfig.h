//
//  ConnectionConfig.h
//  AgileCRM
//
//  Created by Phelipe Maia on 2/2/16.
//  Copyright © 2016 Aiam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ConnectionConfig : NSObject

@property (nonatomic,strong) NSString  *domain;
@property (nonatomic,strong) NSString  *key;
@property (nonatomic,strong) NSString  *email;
@property (nonatomic,strong) NSString  *url;
@property (nonatomic,strong) NSString  *authCode;

- (id)initWithDomain:(NSString *) domain andKey:(NSString *) key andEmail:(NSString *) email;
- (NSURL*)getURL:(NSString *) uri;


@end
