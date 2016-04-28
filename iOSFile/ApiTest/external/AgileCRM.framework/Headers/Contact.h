//
//  Contact.h
//  AgileCRM
//
//  Created by Phelipe Maia on 2/2/16.
//  Copyright © 2016 Aiam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Field.h"

@interface Contact : NSObject

- (id)initWithProperties:(NSMutableArray *) properties andTags:(NSArray *) tags andLeadScore:(NSNumber *) leadScore andStarValue:(NSNumber *) starValue;

@property (nonatomic, copy) NSString *contactId;
@property (nonatomic, copy) NSNumber *count;
@property (nonatomic, copy) NSString *ownerKey;
@property (nonatomic, copy) NSString *widgetProperties;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, strong) NSArray *tags;
@property (nonatomic, strong) NSNumber *leadScore;
@property (nonatomic, strong) NSNumber *starValue;
@property (nonatomic, strong) NSMutableArray *properties;
@property (nonatomic, copy) NSString *createdTime;
@property (nonatomic, copy) NSString *updatedTime;

+ (Contact *)fromJSON:(NSDictionary *)json;
- (NSDictionary *)toJSON;

@end
