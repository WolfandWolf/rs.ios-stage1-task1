#import "PalindromeSolver.h"

@implementation PalindromeSolver

// Complete the highestValuePalindrome function below.
- (NSString *) highestValuePalindrome:(NSString *)s n:(NSNumber *)n k:(NSNumber *)k {
    const char *cString = [s UTF8String];
    int palindromCounter = 0;
    for (int counter = 0; counter < [n floatValue]/2; counter++) {
        if (cString[counter] == cString[[n intValue] - counter - 1]) {
            palindromCounter++;
        }
    }
    if ((ceil([n floatValue]/2) - palindromCounter) <= [k intValue]) {
        if (palindromCounter == ceil([n floatValue]/2))
            return s;
        else {
            char *result = calloc(strlen(cString)+1, 1);
            strncpy(result, cString, strlen(cString));
            int changes = [k intValue];
            int counterFromStart = 0;
            int counterFromEnd = [n intValue] - 1;
            while (counterFromStart < counterFromEnd) {
                if (cString[counterFromStart] != cString[counterFromEnd]) {
                    result[counterFromStart] = result[counterFromEnd] = MAX(cString[counterFromStart], cString[counterFromEnd]);
                    changes--;
                }
                counterFromStart++;
                counterFromEnd--;
            }
            counterFromStart = 0;
            counterFromEnd = [n intValue] - 1;
            while (counterFromStart <= counterFromEnd) {
                if (counterFromStart == counterFromEnd) {
                    if (changes > 0)
                        result[counterFromStart] = '9';
                }
                if (result[counterFromStart] < '9') {
                    if (changes >= 2 && result[counterFromStart] == cString[counterFromStart] && result[counterFromEnd] == cString[counterFromEnd]) {
                        changes = changes - 2;
                        result[counterFromStart] = result[counterFromEnd] = '9';
                    }
                    else if (changes >= 1 && (result[counterFromStart] != cString[counterFromStart] || result[counterFromEnd] != cString[counterFromEnd])) {
                        changes--;
                        result[counterFromStart] = result[counterFromEnd] = '9';
                    }
                }
                counterFromStart++;
                counterFromEnd--;
            }
            NSString *resultString = [NSString stringWithUTF8String:result];
            free(result);
            return resultString;
        }
    }
    else
        return @"-1";
}

@end
