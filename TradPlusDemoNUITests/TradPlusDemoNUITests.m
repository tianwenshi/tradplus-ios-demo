//
//  TradPlusDemoNUITests.m
//  TradPlusDemoNUITests
//
//  Created by root on 2023/9/25.
//  Copyright © 2023 tradplus. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface TradPlusDemoNUITests : XCTestCase
@property (nonatomic, strong) XCUIApplication *app;
@end

@implementation TradPlusDemoNUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    self.app = [[XCUIApplication alloc] init];
    [self.app launch];
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
    [self.app terminate];
    self.app = nil;
}

- (void)testRewardVideoshow {
    XCUIElement *Label = self.app.staticTexts[@"激励视频"];
    XCTAssertTrue(Label.exists, @"No Reward Video Type.");
    [Label tap];
    sleep(3);
    
    for (int i = 0; i < 10; i++) {
        XCUIElement *btn = self.app.buttons[@"加载"];
        XCTAssertTrue(btn.exists, @"No Load Rewarded Video AD btn.");
        [btn tap];
        sleep(3);
        
        BOOL isReady = NO;
        for(int i = 0; i<50; i++) {
            XCUIElement *ready = self.app.staticTexts[@"加载成功"];
            if(ready.exists) {
                isReady = YES;
                break;
            }
            sleep(1);
        }
        
        if (isReady == NO){
            XCTAssertTrue(isReady, @"video ad not ready");
        }
        XCUIElement *show = self.app.buttons[@"显示"];
        [show tap];
        
        sleep(3);
        XCUIElement *adWebview = self.app.webViews[@"ad_webview"];
        XCTAssertTrue(adWebview.exists, @"WKWebView does not exist");
        XCTAssertTrue(adWebview.isHittable, @"WKWebView is not hittable");
        !adWebview.exists?:[adWebview tap];
        sleep(5);
        XCUIApplication *safariApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.apple.mobilesafari"];
        NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"self.state == %d", XCUIApplicationStateRunningForeground];
        XCTestExpectation *appSwitched = [self expectationForPredicate:existsPredicate evaluatedWithObject:safariApp handler:nil];
        [self waitForExpectations:@[appSwitched] timeout:2];
        XCTAssertTrue(safariApp.state == XCUIApplicationStateRunningForeground, @"切换到 Safari 应用程序");
        [self.app activate];
        for(int i = 0; i<50; i++) {
            XCUIElement *closebtn = self.app.buttons[@"ad_closeBtn"];
            if(closebtn.exists) {
                [closebtn tap];
                sleep(2);
                break;
            }
            sleep(1);
        }
        sleep(60);
    }
}

- (void)testInterstitial {
    XCUIElement *Label = self.app.staticTexts[@"插屏"];
    XCTAssertTrue(Label.exists, @"No Interstitial Type.");
    [Label tap];
    sleep(3);
    
    for (int i = 0; i < 10; i++) {
        XCUIElement *btn = self.app.buttons[@"加载"];
        XCTAssertTrue(btn.exists, @"No Load Interstitial AD btn.");
        [btn tap];
        sleep(3);
        
        BOOL isReady = NO;
        for(int i = 0; i<50; i++) {
            XCUIElement *ready = self.app.staticTexts[@"加载成功"];
            if(ready.exists) {
                isReady = YES;
                break;
            }
            sleep(1);
        }
        
        if (isReady == NO){
            XCTAssertTrue(isReady, @"video ad not ready");
        }
        XCUIElement *show = self.app.buttons[@"显示"];
        [show tap];
        
        sleep(3);
        XCUIElement *adWebview = self.app.webViews[@"ad_webview"];
        XCTAssertTrue(adWebview.exists, @"WKWebView does not exist");
        XCTAssertTrue(adWebview.isHittable, @"WKWebView is not hittable");
        !adWebview.exists?:[adWebview tap];
        sleep(5);
        XCUIApplication *safariApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.apple.mobilesafari"];
        NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"self.state == %d", XCUIApplicationStateRunningForeground];
        XCTestExpectation *appSwitched = [self expectationForPredicate:existsPredicate evaluatedWithObject:safariApp handler:nil];
        [self waitForExpectations:@[appSwitched] timeout:2];
        XCTAssertTrue(safariApp.state == XCUIApplicationStateRunningForeground, @"切换到 Safari 应用程序");
        [self.app activate];
        
        for(int i = 0; i < 30; i++) {
            XCUIElement *close = self.app.buttons[@"close_x"];
            if(close.exists) {
                [close tap];
                break;;
            }
            sleep(1);
        }
        sleep(5);
    }
}

-(void)testBanner{
    XCUIElement *Label = self.app.staticTexts[@"横幅"];
    XCTAssertTrue(Label.exists, @"No Banner Type.");
    [Label tap];
    sleep(3);
    
    for (int i = 0; i < 10; i++) {
        XCUIElement *btn = self.app.buttons[@"加载"];
        XCTAssertTrue(btn.exists, @"No Banner AD btn.");
        [btn tap];
        sleep(3);
        
        BOOL isReady = NO;
        for(int i = 0; i<50; i++) {
            XCUIElement *ready = self.app.staticTexts[@"加载成功"];
            if(ready.exists) {
                isReady = YES;
                break;
            }
            sleep(1);
        }
        
        if (isReady == NO){
            XCTAssertTrue(isReady, @"banner ad not ready");
        }
        
        XCUIElement *adWebview = self.app.webViews[@"ad_webview"];
        XCTAssertTrue(adWebview.exists, @"WKWebView does not exist");
        XCTAssertTrue(adWebview.isHittable, @"WKWebView is not hittable");
        !adWebview.exists?:[adWebview tap];
        sleep(5);
        XCUIApplication *safariApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.apple.mobilesafari"];
        NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"self.state == %d", XCUIApplicationStateRunningForeground];
        XCTestExpectation *appSwitched = [self expectationForPredicate:existsPredicate evaluatedWithObject:safariApp handler:nil];
        [self waitForExpectations:@[appSwitched] timeout:2];
        XCTAssertTrue(safariApp.state == XCUIApplicationStateRunningForeground, @"切换到 Safari 应用程序");
        [self.app activate];
        
        sleep(5);
    }
}

-(void)testNative{
    XCUIElement *Label = self.app.staticTexts[@"高级原生"];
    XCTAssertTrue(Label.exists, @"No Native Type.");
    [Label tap];
    sleep(3);
    
    for (int i = 0; i < 10; i++) {
        XCUIElement *btn = self.app.buttons[@"加载"];
        XCTAssertTrue(btn.exists, @"No Native AD btn.");
        [btn tap];
        sleep(3);
        
        BOOL isReady = NO;
        for(int i = 0; i<50; i++) {
            XCUIElement *ready = self.app.staticTexts[@"加载成功"];
            if(ready.exists) {
                isReady = YES;
                break;
            }
            sleep(1);
        }
        
        if (isReady == NO){
            XCTAssertTrue(isReady, @"native ad not ready");
        }
        XCUIElement *show = self.app.buttons[@"显示"];
        [show tap];
        
        XCUIElement *adWebview = self.app.webViews[@"ad_webview"];
        XCTAssertTrue(adWebview.exists, @"WKWebView does not exist");
        XCTAssertTrue(adWebview.isHittable, @"WKWebView is not hittable");
        !adWebview.exists?:[adWebview tap];
        sleep(5);
        XCUIApplication *safariApp = [[XCUIApplication alloc] initWithBundleIdentifier:@"com.apple.mobilesafari"];
        NSPredicate *existsPredicate = [NSPredicate predicateWithFormat:@"self.state == %d", XCUIApplicationStateRunningForeground];
        XCTestExpectation *appSwitched = [self expectationForPredicate:existsPredicate evaluatedWithObject:safariApp handler:nil];
        [self waitForExpectations:@[appSwitched] timeout:2];
        XCTAssertTrue(safariApp.state == XCUIApplicationStateRunningForeground, @"切换到 Safari 应用程序");
        [self.app activate];
        
        sleep(5);
    }
}

-(void)testSplash{
    XCUIElement *Label = self.app.staticTexts[@"开屏"];
    XCTAssertTrue(Label.exists, @"No Splash Type.");
    [Label tap];
    sleep(3);
    
    XCUIElement *btn = self.app.buttons[@"加载"];
    XCTAssertTrue(btn.exists, @"No Splash AD btn.");
    [btn tap];
    sleep(3);
    
    BOOL isReady = NO;
    for(int i = 0; i<50; i++) {
        XCUIElement *ready = self.app.staticTexts[@"加载成功"];
        if(ready.exists) {
            isReady = YES;
            break;
        }
        sleep(1);
    }
    
    if (isReady == NO){
        XCTAssertTrue(isReady, @"Splash ad not ready");
    }
    XCUIElement *show = self.app.buttons[@"显示"];
    [show tap];
    
    sleep(5);
}
@end
