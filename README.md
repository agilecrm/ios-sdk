Agile CRM iOS SDK
=================

[Agile CRM] (https://www.agilecrm.com/) is a new breed CRM software with sales and marketing automation.

Table of contents
---------------

**[Requirements](#requirements)**

**[API's details](#apis-details)**

**[1 Contact](#1-contact)**
  * [1 To get a contact by email](#11-to-get-a-contact-by-email)
  * [2 To get a contact by contact ID](#12-to-get-a-contact-by-contact-id)
  * [3 To create a contact](#13-to-create-a-contact)
  * [4 To update a contact](#14-to-update-a-contact)
  * [5 To delete a contact](#15-to-delete-a-contact)


API's Details
-------------
## 1. Contact
#### 1.1 To create a contact 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation)

```javascript
- (IBAction)addContact;
{
    NSMutableArray *properties = [[NSMutableArray alloc] init];
    Field *f = [[Field alloc] initWithName:@"first_name" andValue:@"Sam" andType:@"SYSTEM"];
    [properties addObject:f];
    
    NSArray *tags = [[NSArray alloc] initWithObjects:@"Tag1", @"Tag2", nil];

    NSNumber *leadScore = [[NSNumber alloc] initWithInt:20];
    NSNumber *starValue = [[NSNumber alloc] initWithInt:30];
    Contact *contact = [[Contact alloc] initWithProperties:properties andTags:tags andLeadScore:leadScore andStarValue:starValue];
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] add:contact onCompletion:^(Contact *contact) {
        self.result.text = [NSString stringWithFormat:@"id %@", contact.contactId];
        NSLog (@"id %@", contact.contactId);
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}
```

#### 1.2 To fetch contact data

###### by id

```javascript
- (IBAction)specificContact;
{
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] getContactWithId:@"5655869022797824" onCompletion:^(Contact *contact) {
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
            self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}
```
###### by email

```javascript
- (IBAction)specificEmailContact;
{
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] getContactWithEmail:@"ff2@gmail.com" onCompletion:^(Contact *contact) {
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
            self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}
```

#### 1.3 To delete a contact

```javascript
- (IBAction)deleteContactById;
{
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] remove:@"5754903989321728" onCompletion:^(BOOL success) {
        if (success) {
            NSLog (@"REMOVED");
            self.result.text = @"REMOVED 5754903989321728";
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}
```

#### 1.4 To update a contact 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation-1)

```javascript
    NSMutableArray *properties = [[NSMutableArray alloc] init];
    Field *f = [[Field alloc] initWithName:@"first_name" andValue:@"Phelipe2" andType:@"SYSTEM"];
    [properties addObject:f];
    
    NSArray *tags = [[NSArray alloc] initWithObjects:@"Tag1", @"Tag2", nil];
    
    NSNumber *leadScore = [[NSNumber alloc] initWithInt:20];
    NSNumber *starValue = [[NSNumber alloc] initWithInt:30];
    Contact *contact = [[Contact alloc] initWithProperties:properties andTags:tags andLeadScore:leadScore andStarValue:starValue];
    contact.contactId = @"5754903989321728";
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"jasonwoodlif" andKey:@"kh6ads340aql34j6augl8ahbhj" andEmail:@"narayanrupraut@agilecrm.com"];
    [[manager contactAPI] update:contact onCompletion:^(Contact *contact) {
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
            self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
```
