#import "Parser.h"

@implementation Parser

// Complete the parseString function below.
- (NSArray <NSString*>*)parseString:(NSString*)string {
    NSString *copyString = [string mutableCopy];
    NSMutableArray *resultArray = [[NSMutableArray alloc] init];
    const char *cString = [copyString UTF8String];
    for (int counter = 0; counter < [copyString length]; counter++) {
        switch (cString[counter]) {
            case '<': {
                int counterHelper = counter + 1;
                int except = 0;
                while (YES) {
                    if (cString[counterHelper] == '<')
                        except++;
                    if (cString[counterHelper] == '>') {
                        if (except == 0)
                            break;
                        else
                            except--;
                    }
                    counterHelper++;
                }
                [resultArray addObject:[copyString substringWithRange:NSMakeRange(counter + 1, counterHelper - 1 - counter)]];
                break;
            }
            case '(': {
                int counterHelper = counter + 1;
                int except = 0;
                while (YES) {
                    if (cString[counterHelper] == '(')
                        except++;
                    if (cString[counterHelper] == ')') {
                        if (except == 0)
                            break;
                        else
                            except--;
                    }
                    counterHelper++;
                }
                [resultArray addObject:[copyString substringWithRange:NSMakeRange(counter + 1, counterHelper - 1 - counter)]];
                break;
            }
            case '[': {
                int counterHelper = counter + 1;
                int except = 0;
                while (YES) {
                    if (cString[counterHelper] == '[')
                        except++;
                    if (cString[counterHelper] == ']') {
                        if (except == 0)
                            break;
                        else
                            except--;
                    }
                    counterHelper++;
                }
                [resultArray addObject:[copyString substringWithRange:NSMakeRange(counter + 1, counterHelper - 1 - counter)]];
                break;
            }
        }
        
    }
    return resultArray;
}

@end
