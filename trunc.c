#include <stdio.h>
#include <math.h>

unsigned long long double2bit(double);
double bit2double(unsigned long long ull);


int main()
{
	double frac = 0.4;
	printf("0.4 = %.17f = 0x%llx\n", frac, double2bit(frac));
	printf("trunc(60*0.4) = %f\n", trunc(60*0.4));
	
	double frac2 = 1.4 - 1.0;
	printf("1.4 - 1.0 = %.17f = 0x%llx\n", frac2, double2bit(frac2));
	printf("trunc(60*(1.4 - 1.0)) = %f\n", trunc(60*(1.4-1.0)));
	
	printf("inbetween = %.17f\n", bit2double(0x3fd9999999999999));
	
	return 0;	
}

unsigned long long double2bit(double d)
{
	union {
		double d;
		unsigned long long ull;
	} temp;
	temp.d = d;
	return temp.ull; // return the bit-representation of this double
}

double bit2double(unsigned long long ull)
{
	union {
		double d;
		unsigned long long ull;
	} temp;
	temp.ull = ull;
	return temp.d;
}