//
//  Field.h
//  AgileCRM
//
//  Created by Phelipe Maia on 2/2/16.
//  Copyright © 2016 Aiam. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Field : NSObject

- (id)initWithName:(NSString *) name andValue:(NSString *) value andType:(NSString *) type;

@property (nonatomic, copy) NSString *subtype;
@property (nonatomic, copy) NSString *value;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *name;

+ (Field *)fromDictionary:(NSDictionary *)ds;

@end
