/* 
 * Adium is the legal property of its developers, whose names are listed in the copyright file included
 * with this source distribution.
 * 
 * This program is free software; you can redistribute it and/or modify it under the terms of the GNU
 * General Public License as published by the Free Software Foundation; either version 2 of the License,
 * or (at your option) any later version.
 * 
 * This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even
 * the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General
 * Public License for more details.
 * 
 * You should have received a copy of the GNU General Public License along with this program; if not,
 * write to the Free Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */

#import "AIMobileMeService.h"
#import "AIPurpleMobileMeAccount.h"
#import "AIPurpleMobileMeAccountViewController.h"
#import <AIUtilities/AIImageAdditions.h>

@implementation AIMobileMeService

//Account Creation
- (Class)accountClass{
	return [AIPurpleMobileMeAccount class];
}

- (AIAccountViewController *)accountViewController{
    return [AIPurpleMobileMeAccountViewController accountViewController];
}

//Service Description
- (NSString *)serviceCodeUniqueID{
	return @"libpurple-oscar-MobileMe";
}
- (NSString *)serviceID{
	return @"MobileMe";
}
- (NSString *)shortDescription{
	return @"MobileMe";
}
- (NSString *)longDescription{
	return @"MobileMe";
}
- (NSCharacterSet *)ignoredCharacters{
	return [NSCharacterSet characterSetWithCharactersInString:@" "];
}
- (BOOL)caseSensitive{
	return NO;
}
- (AIServiceImportance)serviceImportance{
	return AIServiceSecondary;
}
- (NSString *)userNameLabel{
    return AILocalizedString(@"Member Name",nil); //.Mac Member Name
}
/*!
 * @brief Default icon
 *
 * Service Icon packs should always include images for all the built-in Adium services.  This method allows external
 * service plugins to specify an image which will be used when the service icon pack does not specify one.  It will
 * also be useful if new services are added to Adium itself after a significant number of Service Icon packs exist
 * which do not yet have an image for this service.  If the active Service Icon pack provides an image for this service,
 * this method will not be called.
 *
 * The service should _not_ cache this icon internally; multiple calls should return unique NSImage objects.
 *
 * @param iconType The AIServiceIconType of the icon to return. This specifies the desired size of the icon.
 * @return NSImage to use for this service by default
 */
- (NSImage *)defaultServiceIconOfType:(AIServiceIconType)iconType
{
	return [NSImage imageNamed:((iconType == AIServiceIconSmall || iconType == AIServiceIconList) ? @"MobileMe-small" : @"MobileMe-large")
					  forClass:[self class] loadLazily:YES];
}

/*!
 * @brief Path for default icon
 *
 * For use in message views, this is the path to a default icon as described above.
 *
 * @param iconType The AIServiceIconType of the icon to return.
 * @return The path to the image, otherwise nil.
 */
- (NSString *)pathForDefaultServiceIconOfType:(AIServiceIconType)iconType
{
	if ((iconType == AIServiceIconSmall) || (iconType == AIServiceIconList)) {
		return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"MobileMe-small"];
	} else {
		return [[NSBundle bundleForClass:[self class]] pathForImageResource:@"MobileMe-large"];		
	}
}

@end
