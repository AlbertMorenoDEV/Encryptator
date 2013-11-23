//
//  ViewController.m
//  Encryptator
//
//  Created by albert moreno vendrell on 17/11/13.
//  Copyright (c) 2013 Albert Moreno Vendrell. All rights reserved.
//

#import "ViewController.h"
#import "Encrypt.h"

@interface ViewController () {
    NSArray *arrayEncryptTypes;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // escondemos la animacion
    self.statusActivityIndicatorView.alpha = 0;
    
    // asignamos la versión al label
    self.appVersionLabel.text = [NSString stringWithFormat:@"v. %@",[[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"]];
    
    // cargamos los valores del Picker View de los tipos de encriptacion
    self.encryptTypePickerView.delegate = self;
    arrayEncryptTypes = [[NSArray alloc] initWithObjects:@"SHA-1", @"MD5", @"BASE 64", @"CRC 32", nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// Esta funcion es para que cuando el Usuario toque fuera de
// un campo de texto, desaparezca el teclado
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [[event allTouches] anyObject];
    
    // Listo los campos de texto
    if ([self.stringToEncryptTextField isFirstResponder] && [touch view] != self.stringToEncryptTextField) {
        [self.stringToEncryptTextField resignFirstResponder];
    }
    [super touchesBegan:touches withEvent:event];
}

#pragma mark -IBAction

- (IBAction)encryptPushButton:(id)sender
{
    // arrancamos la  animación
    [self.statusActivityIndicatorView startAnimating];
    [UIView animateWithDuration:0.5 animations:^{
        self.statusActivityIndicatorView.alpha = 1;
    }];
    
    // recogemos los valores seleccionados
    NSString *stringToEncrypt = [self.stringToEncryptTextField text];
    int selectedIndexEncryptTypePickerView = [self.encryptTypePickerView selectedRowInComponent:0];
    NSString *selectedValueEncryptTypePickerView = [self pickerView:self.encryptTypePickerView titleForRow:selectedIndexEncryptTypePickerView forComponent:0];
    NSLog(@"Selected type: %@", selectedValueEncryptTypePickerView);
    
    // encriptamos la cadena
    NSString *resultString;
    switch (selectedIndexEncryptTypePickerView) {
        case 0: // SHA-1
            resultString = [self sha1Encrypt:stringToEncrypt];
            break;
            
        case 1: // MD5
            resultString = [self md5Encrypt:stringToEncrypt];
            break;
            
        case 2: // BASE 64
            resultString = [self base64Encrypt:stringToEncrypt];
            break;
            
        case 3: // CRC 32
            resultString = [self crc32Encrypt:stringToEncrypt];
            break;
            
        default:
            NSLog(@"Error!, tipo no controlado: %i.", selectedIndexEncryptTypePickerView);
            resultString = @"ERROR!";
            break;
    }
    
    // mostramos el contenido
    self.resultTextView.text = resultString;
    
    // paramos la animación
    [UIView animateWithDuration:0.5
                     animations:^{
                         self.statusActivityIndicatorView.alpha = 0;
                     }
                     completion:^(BOOL finished){
                         [self.statusActivityIndicatorView stopAnimating];
                     }];
}

#pragma mark - UIPickerView

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [arrayEncryptTypes count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return [arrayEncryptTypes objectAtIndex:row];
}

#pragma mark - Encrypt types

- (NSString *)sha1Encrypt:(NSString *)stringToEncrypt
{
    NSString *returnString;
    returnString = @"TEST";
    return returnString;
}

- (NSString *)md5Encrypt:(NSString *)stringToEncrypt
{
    NSString *returnString;
    returnString = [Encrypt md5:stringToEncrypt];
    return returnString;
}

- (NSString *)base64Encrypt:(NSString *)stringToEncrypt
{
    NSString *returnString;
    returnString = @"TEST";
    return returnString;
}

- (NSString *)crc32Encrypt:(NSString *)stringToEncrypt
{
    NSString *returnString;
    returnString = @"TEST";
    return returnString;
}

@end
