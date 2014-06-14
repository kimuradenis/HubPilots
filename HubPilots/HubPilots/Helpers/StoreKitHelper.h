//
//  StoreKitHelper.h
//  HubPilots
//
//  Created by Denis Kimura on 14/06/14.
//  Copyright (c) 2014 Denis Kimura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <StoreKit/StoreKit.h>

@protocol StoreKitHelperProtocol <NSObject>

- (void)productsRetrieved:(NSArray*)products;

@end

@interface StoreKitHelper : NSObject <SKProductsRequestDelegate, SKPaymentTransactionObserver>

@property (nonatomic, weak) id<StoreKitHelperProtocol> delegate;

-(void)retrieveProductIds;

@end
