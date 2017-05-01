Agile CRM iOS SDK
=================

[Agile CRM](https://www.agilecrm.com/) is a new breed CRM software with sales and marketing automation.

Table of contents
---------------

**[Requirements](#requirements)**

**[API's details](#apis-details)**

**[1 Contact](#1-contact)**
  * [1 To create a contact](#11-to-create-a-contact)
  * [2 To fetch contact data](#12-to-fetch-contact-data)
  * [3 To delete a contact](#13-to-delete-a-contact)
  * [4 To update a contact](#14-to-update-a-contact)
  * [5 Add tag to a contact](#15-add-tag-to-a-contact)
  * [6 Remove tag to a contact](#16-delete-tag-to-a-contact)

**[2. Deal (Opportunity)](#2-deal)**
  * [1 To create a deal](#21-to-create-a-deal)
  * [2 To update a deal](#22-to-update-a-deal)
  * [3 Get deal by ID](#23-get-deal-by-id)
  * [4 Delete deal by ID](#24-delete-deal-by-id)

**[3. Note ](#3-note)**
  * [1 To create a note](#31-to-create-a-note)
  * [2 To update a note](#32-to-update-a-note)
  * [3 Get note by ID](#33-get-note-by-id)
  * [4 Delete note by ID](#34-delete-note-by-id)

- [**Reference**](https://github.com/agilecrm/rest-api)
 
Requirements
------------

1. Xcode with minimum 6.0 and OS X 10.10 

2. iOS 8.3 tested platform

3. Setting domain name and API key

4. You can pull all code from the git or just copy method from [**iOS code**](https://github.com/agilecrm/ios-sdk/blob/master/iOSFile/AgileSDK/AgileSDK/ViewController.m)  and test directly with your domain,email and rest api key

![Finding domain name, email and API key](https://raw.githubusercontent.com/agilecrm/c-sharp-api/master/AgileCRMapi.png)

In the above image, API key is present at the "API & Analytics" tab at `https://mycompany.agilecrm.com/#account-prefs`.

        Domain name : mycompany
        API key     : myagilecrmapikey
        Email       : myagilecrmemail

So you have to update your `https://github.com/agilecrm/ios-sdk/blob/master/iOSFile/ApiTest/ApiTest/ViewController.m`

	
```javascript
  NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/5745057659355136"];
  NSString *authStr = [NSString stringWithFormat:@"%@:%@", @"your_user_email", @"your_rest_api_key"];
  
```

API's details
-------------
## 1. Contact
#### 1.1 To create a contact 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation)

```javascript
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
```

#### 1.2 To fetch contact data

###### by id

```javascript
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
```
###### by email

```javascript
- (IBAction)getContactByEmail:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/search/email/{email}"];
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
```

#### 1.3 To delete a contact

```javascript
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
```

#### 1.4 To update a contact 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation-1)

```javascript
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
```

#### 1.5 Add tag to a contact

```javascript
- (IBAction)updateTagById:(id)sender {
    // Your JSON data:
    NSString *colorArray = @"{\"id\":5749641194766336, \"tags\":[\"tag1\", \"tag2\"]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/edit/tags"];
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
```

#### 1.6 Delete tag to a contact

```javascript
- (IBAction)deleteTagById:(id)sender {
    // Your JSON data:
    NSString *colorArray = @"{\"id\":5749641194766336, \"tags\":[\"tag1\", \"tag2\"]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/contacts/delete/tags"];
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
```

## 2. Deal
#### 2.1 To create a deal 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation-9)

```javascript
- (IBAction)createDeal:()sender {
    // Your JSON data:
    NSString *colorArray = @"{\"name\":\"Deal-Tomato11111\",\"expected_value\":\"500\",\"probability\":90,\"close_date\":1455042600,\"milestone\":\"Proposal\",  \"contact_ids\":[\"5749641194766336\", \"5758948741218306\"], \"custom_data\":[{\"name\":\"Group Size\",\"value\":\"20\"}]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/opportunity"];
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
```

#### 2.2 To update a deal 

- [**Acceptable request representation for contact**](https://github.com/agilecrm/rest-api#acceptable-request-representation-10)

```javascript
- (IBAction)updateDealById:()sender {
    // Your JSON data:
    NSString *colorArray = @"{\"id\":5722251114577920,\"name\":\"Deal-Tomato Updated\",\"expected_value\":\"900\",\"probability\":90,\"close_date\":1455042600,\"milestone\":\"Proposal\",  \"contact_ids\":[\"5749641194766336\", \"5758948741218306\"], \"custom_data\":[{\"name\":\"Group Size\",\"value\":\"20\"}]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/opportunity/partial-update"];
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
```

#### 2.3 Get deal by ID


```javascript
- (IBAction)getDealById:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/opportunity/5733975435771904"];
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
```

#### 2.4 Delete deal by ID


```javascript
- (IBAction)deleteDealById:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/opportunity/5733975435771904"];
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
```

## 3. Note
#### 3.1 To create a Note 

```javascript
- (IBAction)createNote:()sender {
    // Your JSON data:
    NSString *colorArray = @"{\"subject\":\"Note subject hello \",\"description\":\"Note description gone successfull after contact paid us\", \"contact_ids\":[\"5696538890207232\", \"5758948741218306\"]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/notes"];
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
```

#### 3.2 To create a note to a deal


```javascript
- (IBAction)createNoteToDeal:()sender {
    // Your JSON data:
    NSString *colorArray = @"{\"subject\":\"Note subject hello \",\"description\":\"Note description gone successfull after contact paid us\", \"deal_ids\":[\"5728337217454080\", \"5758948741218306\"]}";
    NSLog(@"colorArray=%@", colorArray);
    
    // Convert to JSON object:
    NSArray *jsonObject = [NSJSONSerialization JSONObjectWithData:[colorArray dataUsingEncoding:NSUTF8StringEncoding]
                                                          options:0 error:NULL];
    
    NSLog(@"jsonObject=%@", jsonObject);

    NSData *requestData = [colorArray dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/opportunity/deals/notes"];
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
```

#### 3.3 Get note by ID


```javascript
- (IBAction)getNoteById:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/notes/5745057659355136"];
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

```

#### 3.4 Delete note by ID


```javascript
- (IBAction)deleteNoteById:(id)sender {
    NSLog(@"Get Contact By ID");
    NSURL *url = [NSURL URLWithString: @"https://{your_domain}.agilecrm.com/dev/api/notes/5745057659355136"];
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

```
