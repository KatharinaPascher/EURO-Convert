//
//  Currency.m
//  EURO Converter
//
//  Created by Katharina Pascher on 08.04.15.
//  Copyright (c) 2015 Katharina Pascher. All rights reserved.
//

#import "Currency.h"

@implementation Currency

@synthesize currencyID,currencyName,currencyValue;


-(id) initWithCurrencyId: (NSString *) cID andCurrencyName:(NSString *) cName andCurrencyValue: (NSString *) cValue;
{
    self = [super init];
    if (self) {
        currencyID = @"ID";
        currencyName = @"Name";
        currencyValue = @"Value";
    }
    return self;
}

@end
