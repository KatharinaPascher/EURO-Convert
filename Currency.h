//
//  Currency.h
//  EURO Converter
//
//  Created by Katharina Pascher on 08.04.15.
//  Copyright (c) 2015 Katharina Pascher. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Currency : NSObject


@property (nonatomic,strong) NSString * currencyID;
@property (nonatomic,strong) NSString * currencyName;
@property (nonatomic,strong) NSString * currencyValue;

//Methods

-(id) initWithCurrencyId: (NSString *) cID andCurrencyName:(NSString *) cName andCurrencyValue: (NSString *) cValue;

@end
