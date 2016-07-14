//
//  ViewController.m
//  AgileSDK
//
//  Created by graut on 5/12/16.
//  Copyright (c) 2016 graut. All rights reserved.
//

#import "ViewController.h"

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
- (IBAction)getContactById:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/5745057659355136"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"GET"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"your_user_email", @"your_rest_api_key"];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          
          NSLog(@"Hello success");
          NSLog(@"response%@",response);
          NSString *str = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
          NSLog(@"data%@",str);
          
      }] resume];
    
    NSLog(@"End of test");
}

- (IBAction)deleteContactById:(id)sender {
    
    NSLog(@"delete contact by ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/5680432024649728"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"DELETE"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"your_user_email", @"your_rest_api_key"];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          
          NSLog(@"Hello success");
          NSLog(@"response%@",response);
          NSString *str = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
          NSLog(@"data%@",str);
          
      }] resume];
    
    NSLog(@"End of test");
}

- (IBAction)createContact:(id)sender {
    // Your JSON data:
    NSString *colorArray = @"{\"lead_score\":44,  \"tags\":[\"tag1\", \"tag2\"], \"properties\":[{\"type\":\"SYSTEM\", \"name\":\"email\",\"value\":\"jason12345623y@gmail.com\"}, {\"type\":\"SYSTEM\", \"name\":\"first_name\", \"value\":\"First_name\"}, {\"type\":\"SYSTEM\", \"name\":\"last_name\", \"value\":\"Last_name\"}]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"your_user_email", @"your_rest_api_key"];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          
          NSLog(@"Hello success");
          NSLog(@"response%@",response);
          NSString *str = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
          NSLog(@"data%@",str);
          
      }] resume];
    
    NSLog(@"End of test");
}

- (IBAction)updateContactById:(id)sender {
    // Your JSON data:
    NSString *colorArray = @"{\"id\":5729057832435712, \"properties\":[{\"type\":\"SYSTEM\", \"name\":\"email\",\"value\":\"jason12345623y@gmail.com\"}, {\"type\":\"SYSTEM\", \"name\":\"first_name\", \"value\":\"laki\"}, {\"type\":\"SYSTEM\", \"name\":\"last_name\", \"value\":\"Ali\"}]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/edit-properties"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:[NSString stringWithFormat:@"%d", [requestData length]] forHTTPHeaderField:@"Content-Length"];
    [request setHTTPBody: requestData];
    
    NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"your_user_email", @"your_rest_api_key"];
    NSData *authData = [authStr dataUsingEncoding:NSUTF8StringEncoding];
    NSString *authValue = [NSString stringWithFormat:@"Basic %@", [authData base64EncodedStringWithOptions:0]];
    [request setValue:authValue forHTTPHeaderField:@"Authorization"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    [[session dataTaskWithRequest:request completionHandler:
      ^(NSData *data, NSURLResponse *response, NSError *error) {
          
          NSLog(@"Hello success");
          NSLog(@"response%@",response);
          NSString *str = [[NSString alloc] initWithData: data encoding:NSUTF8StringEncoding];
          NSLog(@"data%@",str);
          
      }] resume];
    
    NSLog(@"End of test");
}
@end
