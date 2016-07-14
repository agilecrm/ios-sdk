//
//  ViewController.m
//  ApiTest
//
//  Created by Ghanshyam on 28/04/16.
//  Copyright © 2016 Ghanshyam. All rights reserved.
//

#import "ViewController.h"
#import <AgileCRM/AgileCRM.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)contacts;
{
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] listContacts:^(NSMutableArray *contacts) {
        for (Contact *yourVar in contacts) {
            NSLog(@"%@", yourVar.contactId);
            for (Field *yourVar2 in yourVar.properties) {
                NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
                self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
            }
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}

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

- (IBAction)addContact;
{
    NSMutableArray *properties = [[NSMutableArray alloc] init];
    Field *f = [[Field alloc] initWithName:@"first_name" andValue:@"Phelipe" andType:@"SYSTEM"];
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

- (IBAction)updateContact;
{
    NSMutableArray *properties = [[NSMutableArray alloc] init];
    Field *f = [[Field alloc] initWithName:@"first_name" andValue:@"Phelipe2" andType:@"SYSTEM"];
    [properties addObject:f];
    
    NSArray *tags = [[NSArray alloc] initWithObjects:@"Tag1", @"Tag2", nil];
    
    NSNumber *leadScore = [[NSNumber alloc] initWithInt:20];
    NSNumber *starValue = [[NSNumber alloc] initWithInt:30];
    Contact *contact = [[Contact alloc] initWithProperties:properties andTags:tags andLeadScore:leadScore andStarValue:starValue];
    contact.contactId = @"5754903989321728";
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] update:contact onCompletion:^(Contact *contact) {
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
            self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}

- (IBAction)updateContactById;
{
    NSDictionary *systemFieldsElem = [[NSDictionary alloc] initWithObjectsAndKeys:@"first_name", @"name", @"Phelipe3", @"value", nil];
    NSArray *systemFields = [[NSArray alloc] initWithObjects:systemFieldsElem, nil];
    
    NSDictionary *customFieldsElem = [[NSDictionary alloc] initWithObjectsAndKeys:@"test", @"name", @"ABC", @"value", nil];
    NSArray *customFields = [[NSArray alloc] initWithObjects:customFieldsElem, nil];
    AgileCRMManager *manager = [[AgileCRMManager alloc] initWithDomain:@"your_domain" andKey:@"your_rest_api_key" andEmail:@"your_email"];
    [[manager contactAPI] updateWithId:@"5754903989321728" andSystemFields:systemFields andCustomFields:customFields onCompletion:^(Contact *contact) {
        for (Field *yourVar2 in contact.properties) {
            NSLog (@"%@ - %@", yourVar2.name, yourVar2.value);
            self.result.text = [NSString stringWithFormat:@"%@ - %@", yourVar2.name, yourVar2.value];
        }
    } onError:^(NSError *originalError) {
        NSLog(@"Error");
    }];
    
}

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

@end
