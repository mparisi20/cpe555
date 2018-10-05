#include <stdio.h>
#include <math.h>

// Max Parisi 
// 9/27/18
// CPE-555 Homework 3 

/* User inputs latitude and longitude via standard input using signed decimal degrees (DD); 
   the program converts these coordinates to degrees, minutes, and seconds (DMS) and
   prints the result in standard output.
*/

int convertToDMS(double dd, double *degrees, double *minutes, double *seconds);

int main()
{
	double lat, lon, d, m, s;
	char direction;
	
	// Introduce program and retrieve input
	printf("---Latitude/Longitude DD-to-DMS Converter---\n\n");
	printf("Enter coordinates in decimal form:\n");
	printf("Latitude: ");
	scanf("%lf", &lat);
	printf("Longitude: ");
	scanf("%lf", &lon);
	putchar('\n');
	
	// Convert latitude and print result
	if (lat <= 90 && lat >= -90) {
		direction = convertToDMS(lat, &d, &m, &s) ? 'N' : 'S'; // use the sign of the DD number to determine direction for the DMS format
		printf("Latitude in DMS: %.0f degrees, %.0f minutes, %.6f seconds %c\n", 
				d, m, s, direction);
	}
	else
		printf("Bounds error on latitude... must be [-90,90]\n");
			
	// Convert longitude and print result
	if (lon <= 180 && lon >= -180) {
		direction = convertToDMS(lon, &d, &m, &s) ? 'E' : 'W';
		printf("Longitude in DMS: %.0f degrees, %.0f minutes, %.6f seconds %c\n", 
				d, m, s, direction);
	}
	else
		printf("Bounds error on longitude... must be [-180,180]\n");
	
	return 0;
}

/* Take a number in decimal degrees (DD) and convert it to degrees-minutes-seconds 
 * (DMS). Transfer the degrees, minutes, and seconds to the caller function via the pointers 
 * provided as parameters.
 * 
 * The return value is a code representing the sign of the DMS number (1 for >= 0; 0 for < 0 ).
 */ 
int convertToDMS(double dd, double *d, double *m, double *s)
{
	double degrees, minutes, seconds, frac;
	degrees = floor(fabs(dd));
	frac = fabs(dd) - degrees; // save the absolute value of the number's fractional component
	minutes = floor(60*frac);
	seconds = 60*(60*frac - minutes);
	*d = degrees;
	*m = minutes;
	*s = seconds;
	return (dd >= 0) ? 1 : 0; // return 1 for positive, 0 for negative
}
