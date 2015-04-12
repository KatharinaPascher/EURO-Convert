//
//  ViewController.m
//  EURO Converter
//
//  Created by Katharina Pascher on 08.04.15.
//  Copyright (c) 2015 Katharina Pascher. All rights reserved.
//
#import "Currency.h"
#import "ViewController.h"


@interface ViewController ()

@end

#define getDataURL @"http://api.fixer.io/latest"
@implementation ViewController

@synthesize picker, waerungen, eingabeFeld, ausgabefeld,json,currencyArray,ausgabewaehrung;






- (void)viewDidLoad {
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"waerungen" ofType:@"plist"];
    
    
    waerungen = [[NSArray alloc]initWithContentsOfFile:path];
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)ConvertButton:(UIButton *)sender {
    [self calculateCurrency ];
}


#pragma -PickerView
/* New put not working

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;// or the number of vertical "columns" the picker will show...
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    if (currencyArray!=nil) {
        return [currencyArray count];//this will tell the picker how many rows it has - in this case, the size of your loaded array...
    }
    return 0;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    //you can also write code here to descide what data to return depending on the component ("column")
    if (currencyArray!=nil) {
        return [currencyArray objectAtIndex:row];//assuming the array contains strings..
    }
    return @"";//or nil, depending how protective you are
}

*/


// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{

    return 1;}


- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return waerungen [row];


}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    return [waerungen count];}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSInteger select = row;
   
    if(select == 0){
        ausgabewaehrung.text =@"AUD";
    
    }
    if(select==1){
        ausgabewaehrung.text =@"BGN";
        
    }
    if(select == 2){
        ausgabewaehrung.text =@"BRL";
        
    }
    if(select ==3){
        ausgabewaehrung.text =@"CAD";
        
    }
    if(select ==4){
        ausgabewaehrung.text =@"CHF";
        
    }
    if(select ==5){
        ausgabewaehrung.text =@"CNY";
        
    }
    if(select ==6){
        ausgabewaehrung.text =@"CZK";
        
    } if(select ==7){
        ausgabewaehrung.text =@"GKK";
        
    } if(select ==8){
        ausgabewaehrung.text =@"GBP";
        
    } if(select ==9){
        ausgabewaehrung.text =@"HKD";
        
    
} if(select ==10){
    ausgabewaehrung.text =@"HRK";
    
} if(select ==11){
    ausgabewaehrung.text =@"HUF";
    
} if(select ==12){
    ausgabewaehrung.text =@"IDR";
    
}
    else if (select > 12)
        ausgabewaehrung.text = @"EUR";


}
 

#pragma -TextField

-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    // löschen soll erlaubt sein
    if(string.length==0) return YES;
    
    //nur zahlen erlaubt
    NSCharacterSet *erlaubteZeichen = [NSCharacterSet characterSetWithCharactersInString:@".0123456789"];
    if([erlaubteZeichen characterIsMember:[string characterAtIndex:0]])
    return YES;

    return NO;}


-(void)textFieldDidBeginEditing:(UITextField *)textField {
self.ausgabefeld.text=@"....";}


-(void)textFieldDidEndEditing:(UITextField *)textField{

self.ausgabefeld.text=@"";}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{

    [textField resignFirstResponder];
    return YES;}

#pragma -methods


- (double) runden :(double) wert stellen: (int) stellenAnzahl{
    int wertHilf;
    int divisor;
    switch (stellenAnzahl)
    {
        case 1: divisor = 10; break;
        case 2: divisor = 100; break;
        case 3: divisor = 1000; break;
        case 4: divisor = 10000; break;
        case 5: divisor = 100000; break;
        default: divisor = 1; break;
    }
    wertHilf = (int)(wert * divisor + 0.5);
    double wertGerundet = (double)(wertHilf)/divisor;
    return wertGerundet;
}



-(void)retrieveData{

    NSURL *url = [NSURL URLWithString:getDataURL];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    json = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];

 //setup currencyArray
   
    NSMutableArray *currencyArray =[[NSMutableArray alloc]init];


  
    
    for (int i = 0; i<json.count; i++) {
        //create currency object
        
        NSString *cID = [[json objectAtIndex:i]objectForKey:@"currencyId"];
        NSString *cName = [[json objectAtIndex:i]objectForKey:@"currencyName"];
        NSString *cValue = [[json objectAtIndex:i]objectForKey:@"currencyValue"];
        
    
    Currency *myCurrency = [[Currency alloc]initWithCurrencyId:cID andCurrencyName:cName andCurrencyValue:cValue];
        
    
    
      [currencyArray addObject:myCurrency];
    
    }}
-(void) calculateCurrency{

    NSString *eingabe = eingabeFeld.text;
    
 
    float inteingabe = [eingabe floatValue];
    
    
   
    
    float multiplikator;
    
    if (waerungen[0]) {
        multiplikator = 1.4078;
        
    }
    if (waerungen[1]) {
        multiplikator = 1.9558;
        
    } if (waerungen[2]) {
        multiplikator = 3.3676;
        
    } if (waerungen[3]) {
        multiplikator = 1.3487;
        
    } if (waerungen[4]) {
        multiplikator = 1.9558;
        
    } if (waerungen[5]) {
        multiplikator = 1.9558;
        
    } if (waerungen[6]) {
        multiplikator = 1.9558;
        
    } if (waerungen[7]) {
        multiplikator = 1.9558;
        
    } if (waerungen[8]) {
        multiplikator = 1.9558;
        
    } if (waerungen[9]) {
        multiplikator = 1.9558;
        
    } if (waerungen[10]) {
        multiplikator = 1.9558;
        
    } if (waerungen[11]) {
        multiplikator = 1.9558;
        
    }
    else {multiplikator = 1;}
 
    

    float intausgabe = multiplikator * inteingabe;
    
    NSString *stringAusgabe = [NSString stringWithFormat:@"%f", intausgabe];
    ausgabefeld.text = stringAusgabe;

}


    
@end
    
