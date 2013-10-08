//
//  ViewController.m
//  ModelTest
//
//  Created by 河原 on 2013/10/08.
//  Copyright (c) 2013年 河原. All rights reserved.
//

#import "ViewController.h"
#import <sys/utsname.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *machineName = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    NSDictionary *deviceNamesDictionary =
    @{
      //simulator
      @"i386":     @"iPhone Simulator",
      @"x86_64":   @"iPad Simulator",
      
      //AppleTV
      @"AppleTV2,1":  @"Apple TV 2G(Original)",
      @"AppleTV3,1":  @"Apple TV 3G(Original)",
      @"AppleTV3,1":  @"Apple TV 3G(Rev A)",
      
      //iPad
      @"iPad1,1":  @"iPad 1G",
      @"iPad2,1":  @"iPad 2(WiFi)",
      @"iPad2,2":  @"iPad 2(GSM)",
      @"iPad2,3":  @"iPad 2(CDMA)",
      @"iPad2,4":  @"iPad 2(WiFi Rev A)",
      @"iPad3,1":  @"iPad 3(WiFi)",
      @"iPad3,2":  @"iPad 3(GSM+CDMA)",
      @"iPad3,3":  @"iPad 3(GSM)",
      @"iPad3,4":  @"iPad 4(WiFi)",
      @"iPad3,5":  @"iPad 4(GSM)",
      @"iPad3,6":  @"iPad 4(GSM+CDMA)",
      
      //iPadMini
      @"iPad2,5":  @"iPad Mini 1G(WiFi)",
      @"iPad2,6":  @"iPad Mini 1G(GSM)",
      @"iPad2,7":  @"iPad Mini 1G(GSM+CDMA)",
      
      //iPhone
      @"iPhone1,1":    @"iPhone 2G(GSM)",
      @"iPhone1,2":    @"iPhone 3G(GSM)",
      @"iPhone2,1":    @"iPhone 3GS(GSM)",
      @"iPhone3,1":    @"iPhone 4(GMS)",
      @"iPhone3,2":    @"iPhone 4(GSM Rev A)",
      @"iPhone3,3":    @"iPhone 4(CDMA)",
      @"iPhone4,1":    @"iPhone 4S(GMS+CDMA)",
      @"iPhone5,1":    @"iPhone 5(GSM)",
      @"iPhone5,2":    @"iPhone 5(GSM+CDMA)",
      @"iPhone5,3":    @"iPhone 5c(GSM)",
      @"iPhone5,4":    @"iPhone 5c(Global)",
      @"iPhone6,1":    @"iPhone 5s(GSM)",
      @"iPhone6,2":    @"iPhone 5s(Global)",
      
      //iPod
      @"iPod1,1":  @"iPod touch 1G",
      @"iPod2,1":  @"iPod touch 2G",
      @"iPod3,1":  @"iPod touch 3G",
      @"iPod4,1":  @"iPod touch 4G",
      @"iPod5,1":  @"iPod touch 5G",
      };
    
    NSString *deviceName = deviceNamesDictionary[machineName];
    
    if (deviceName == nil) {
        deviceName = machineName;
    }
    
    NSLog(@"s.machine  %s\n",systemInfo.machine);   //ハードウェアの種類
    NSLog(@"deviceNameDictionary  %@", deviceName);       //ハードウェアディクショナリー変換
    NSLog(@"s.sysname  %s\n",systemInfo.sysname);   //OS名
	NSLog(@"s.nodename  %s\n",systemInfo.nodename); //host名
	NSLog(@"s.release  %s\n",systemInfo.release);   //リリースレベル
	NSLog(@"s.version  %s\n",systemInfo.version);   //バージョン番号
    
    
    
    UIDevice *device = [UIDevice currentDevice];
    
    NSLog(@"device.name  %@\n",device.name);                                        //実機につけた名前
    NSLog(@"device.systemName  %@\n",device.systemName);                            //OSの名前
	NSLog(@"device.systemVersion  %@\n",device.systemVersion);                      //OSのバージョン
	NSLog(@"device.model  %@\n",device.model);                                      //デバイスのモデル
	NSLog(@"device.localizedModel  %@\n",device.localizedModel);                    //ローカルバージョン
    NSLog(@"device.userInterfaceIdiom  %ld\n",device.userInterfaceIdiom);            //iPadか否か
    NSLog(@"device.multitaskingSupported  %d\n",device.multitaskingSupported);    //バックグラウンドタスク
    NSLog(@"device.batteryLevel  %f\n",device.batteryLevel);                        //バッテリー残量（0.0～1.0）
    NSLog(@"device.batteryState  %ld\n",device.batteryState);                        //バッテリー状態
    NSLog(@"device.identifierForVendor　 %@\n", device.identifierForVendor);        //UDIDっぽいやつ。

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
