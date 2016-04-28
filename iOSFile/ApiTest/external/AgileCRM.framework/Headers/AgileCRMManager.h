//
//  AgileCRMManager.h
//  AgileCRM
//
//  Created by Phelipe Maia on 2/2/16.
//  Copyright © 2016 Aiam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ContactAPI.h"
#import "ConnectionConfig.h"

@interface AgileCRMManager : NSObject

- (id)initWithDomain:(NSString *) domain andKey:(NSString *) key andEmail:(NSString *) email;
@property (nonatomic,strong) NSString  *domain;
@property (nonatomic,strong) NSString  *key;
@property (nonatomic,strong) NSString  *email;

@property (nonatomic,strong) ContactAPI  *contactAPI;
@property (nonatomic,strong) ConnectionConfig  *connectionConfig;

@end
