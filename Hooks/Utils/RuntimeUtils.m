#import "RuntimeUtils.h"
@implementation RuntimeUtils : NSObject
+(NSDictionary*)propertyListForObject:(id)Object{
    NSLog(@"propertyListForObject:");
	unsigned pcount;
    objc_property_t *props = class_copyPropertyList([Object class], &pcount);
 	NSMutableDictionary *PropList = [NSMutableDictionary dictionary];

    unsigned i;
    for (i = 0; i < pcount; i++)
    {
        objc_property_t property = props[i];
        NSString *PropName = [NSString stringWithUTF8String:property_getName(property)];
        id propObject=[Object valueForKey:PropName];
        if(propObject!=nil){
            [PropList setObject:propObject forKey:PropName];
                            }
        [propObject release];
        [PropName release];
    }

    free(props);

    return PropList;

}
@end