#import "T1Array.h"

@implementation T1Array

// Complete the following fuction
- (NSArray *)convertToHappy:(NSArray *)sadArray {
    if (!([sadArray count] == 0)) {
        NSMutableArray *copySadArray = [sadArray mutableCopy];
        unsigned long arrayLenght = [copySadArray count];
        for (int counter = 1; counter < (arrayLenght - 1); counter++) {
            if (([copySadArray[counter - 1] intValue] + [copySadArray[counter + 1] intValue]) < [copySadArray[counter] intValue])
            {
                [copySadArray removeObjectAtIndex:(counter)];
                arrayLenght = [copySadArray count];
                counter = 1;
            }
        }
        return copySadArray;
    }
    return @[];
}


@end
