
#import <XCTest/XCTest.h>
#import "BaseModel.h"


@interface 		TestModel : BaseModel
@property 		 NSString * string;				@end
@implementation TestModel
- (BOOL)
															@end

@interface BaseModelTests : XCTestCase

@end

@implementation BaseModelTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}



- (void)testSetSharedInstanceToNil
{
    //set property on shared instance
    [TestModel sharedInstance].string = @"foo";
    
    //replace shared instance
    [TestModel setSharedInstance:nil];
    
    //verify that it worked
    NSAssert([TestModel sharedInstance].string == nil, @"Failed to clear shared instance");
}

@end
