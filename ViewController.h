//
//  ViewController.h
//  EURO Converter
//
//  Created by Katharina Pascher on 08.04.15.
//  Copyright (c) 2015 Katharina Pascher. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
<UIPickerViewDataSource, UIPickerViewDelegate,UITextFieldDelegate>

@property(nonatomic, strong) NSArray *waerungen;

@property (weak, nonatomic) IBOutlet UILabel *ueberschrift;

@property (weak, nonatomic) IBOutlet UIPickerView *picker;

@property (weak, nonatomic) IBOutlet UILabel *textfeld1;
@property (weak, nonatomic) IBOutlet UILabel *textfeld2;
@property (weak, nonatomic) IBOutlet UILabel *ausgabefeld;

@property (weak, nonatomic) IBOutlet UILabel *ausgabewaehrung;
@property (weak, nonatomic) IBOutlet UITextField *eingabeFeld;

- (IBAction)ConvertButton:(UIButton *)sender;

@property (weak, nonatomic) NSArray *json;

@property (strong, nonatomic) NSMutableArray *currencyArray;

- (double) runden :(double) wert stellen: (int) stellenAnzahl;
-(void) retrieveData;
-(void) calculateCurrency;


@end

