//  BaseModel+AtoZ.h
//  AtoZ
//  Created by Alex Gray on 4/10/13.

#import "BaseModel.h"



#define iClass 	self.class
#define sharedI 	iClass.sharedInstance

void logClassMethods(NSString *className);

/*
@interface BaseModel () 
- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel;
- (void)forwardInvocation:(NSInvocation*)invocation;  // FIERCE
- (BOOL)respondsToSelector:(SEL)selector;
@end
*/

typedef void (^KVOLastChangedBlock)( NSS *whatKeyChanged, id whichInstance, id newVal);
typedef void (^KVONewInstanceBlock)( id newInstance );

extern NSString *const BaseModelDidAddNewInstance;

@interface BaseModel (AtoZ)

/* Shared instance is the object modified after each key change.
	After being notified of change to the shared instance, 
	call this to get last modified key of last modified instance */
+ (NSS*)	lastModifiedKey;
+ (INST)	lastModifiedInstance;
+ (void)	setLastModifiedKey:	(NSS*)key instance:(id)object;

+ (void)	setLastChangedBlock:	(KVOLastChangedBlock) lastChangedBlock;
+ (void)	setNewInstanceBlock: (KVONewInstanceBlock) onInitBlock;

+ (NSUI) activeSubclasses;
+ (NSUI) allInstanceCt;
//+ (INST)	objectAtIndex:(NSUI)idx;
+ (NSUI) instanceCt;
+ (NSA*) allInstances;
@property (RONLY) NSA* allInstances;
@property (RONLY) NSUI instanceCt;

@property (RONLY) 		NSN	*instanceNumber;
@property (RONLY) 		NSA 	*superProperties;
// A readonly accessor that searches forst if methods are defaults collection, then for 
@property (NATOM,RDWRT)	id		defaultCollection;

@property (NATOM,ASS) 	BOOL 	defaultCollectionIsMethods;
// Key that maps the "default" cillection backing store.  defaults to @"items".  Settable.
@property (STRNG)			NSS*	defaultCollectionKey;
@property (RONLY) 		NSS 	*uniqueID;
@property (NATOM,ASS) 	BOOL 	 convertToXML;

//+ (NSS*) saveFilePath;
-   (id) objectForKeyedSubscript:					(id)  key;
-   (id) objectAtIndexedSubscript:					(NSUI)idx;
- (void) setObject: (id)obj atIndexedSubscript: (NSUI)idx;
- (void) setObject: (id)obj forKeyedSubscript:  (IDCP)key;
//+
//-   (id) valueForUndefinedKey:						(NSS*)key;
@end
