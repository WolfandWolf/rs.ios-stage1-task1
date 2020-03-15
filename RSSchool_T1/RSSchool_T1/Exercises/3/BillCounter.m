#import "BillCounter.h"

@implementation BillCounter

// Complete the following fuction
- (NSString*)compareResultForBill:(NSArray<NSNumber*>*)bill notIncludingElementWithIndex:(NSInteger)index withGivenSum:(NSNumber*)sum {
    NSMutableArray *billCopy = [bill mutableCopy];
    NSNumber *sumMenu = [billCopy valueForKeyPath:@"@sum.self"];
    [billCopy removeObjectAtIndex:index];
    if ([[billCopy valueForKeyPath:@"@sum.self"] intValue] / 2 == [sum intValue])
        return @"Bon Appetit";
    else {
        if ([sumMenu intValue] / 2  == [sum intValue]) {
            sumMenu = [NSNumber numberWithInt:(([sumMenu intValue] / 2) - ([[billCopy valueForKeyPath:@"@sum.self"] intValue] / 2)) ];
            return [sumMenu stringValue];
        }
        else {
            sumMenu = [NSNumber numberWithInt:([sum intValue] - ([[billCopy valueForKeyPath:@"@sum.self"] intValue] / 2)) ];
            return [sumMenu stringValue];
        }
    }
}

@end
