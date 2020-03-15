#import "MiniMaxArrayConverter.h"

@implementation MiniMaxArrayConverter

// Complete the convertFromArray function below.
- (NSArray<NSNumber*>*)convertFromArray:(NSArray<NSNumber*>*)array {
    NSArray<NSNumber*>* copyArray = [array mutableCopy];
    copyArray = [copyArray sortedArrayUsingSelector:@selector(compare:)];
    unsigned long arrayLenght = [array count];
    int minSum = 0, maxSum = 0;
    for (int counter = 0; counter < arrayLenght - 1; counter++) {
        minSum += [copyArray[counter] intValue];
        maxSum += [copyArray[arrayLenght - 1 - counter] intValue];
    }
    NSMutableArray *resultArray = [NSMutableArray arrayWithCapacity:2];
    [resultArray insertObject:[NSNumber numberWithInt:minSum] atIndex:0];
    [resultArray insertObject:[NSNumber numberWithInt:maxSum] atIndex:1];
    return resultArray;
}

@end
