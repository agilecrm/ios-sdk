//
//  ContactAPI.h
//  AgileCRM
//
//  Created by Phelipe Maia on 2/2/16.
//  Copyright © 2016 Aiam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Contact.h"
#import "ConnectionConfig.h"

@interface ContactAPI : NSObject

@property (nonatomic,strong) ConnectionConfig  *connectionConfig;

- (id)initWithConfig:(ConnectionConfig *) connectionConfig;

typedef void (^ContactsReponse)(NSMutableArray *contacts);

typedef void (^ContactReponse)(Contact *contact);

typedef void (^ErrorBlock)(NSError *originalError);

typedef void (^BoolReponse)(BOOL result);

- (void)listContacts:(ContactsReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)getContactWithId:(NSString *) contactId onCompletion:(ContactReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)getContactWithEmail:(NSString *) email onCompletion:(ContactReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)add:(Contact *) contact onCompletion:(ContactReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)update:(Contact *) contact onCompletion:(ContactReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)updateWithId:(NSString *) contactId andSystemFields:(NSArray *) fields andCustomFields:(NSArray *) customFields onCompletion:(ContactReponse)responseBlock onError:(ErrorBlock)errorBlock;
- (void)remove:(NSString *) contactId onCompletion:(BoolReponse)responseBlock onError:(ErrorBlock)errorBlock;
@end
