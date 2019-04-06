import std.stdio;
import std.math: PI;

enum N = 10;

ulong factorial(ulong n)
{
	ulong r = 1;
	for (int i = 2; i <= n; i++)
		r *= i;
	return r;
}

// faster?
int neg_pow(int n)
{
	return n % 2 == 0 ? 1 : -1;
}

double cosine(double x) 
{
	double sum = 0.0;
	for (int n = 0; n < N; n++) 
	{
		double top = cast(double)(x ^^ cast(double)(2 * n));
		double bottom = cast(double)(factorial(2 * n));
		int alternation = neg_pow(n);
		double an = cast(double)alternation * (top / cast(double)bottom);
		sum += an;
	}
	return sum;
}

double sine(double x)
{
	double sum = 0.0;
	for (int n = 0; n < N; n++) 
	{
		double top = cast(double)(x ^^ cast(double)(2 * n + 1));
		double bottom = cast(double)(factorial(2 * n + 1));
		int alternation = neg_pow(n);
		double an = cast(double)alternation * (top / cast(double)bottom);
		sum += an;
	}
	return sum;
}

double tangent(double x)
{
	return sine(x) / cosine(x);
}

void main()
{
	cosine(PI).writeln; // -1
	cosine(0).writeln; // 1
	sine(0).writeln; // 0
	sine(PI).writeln; // 0 (or close to it)
	sine(PI / 2.0).writeln; // 1
	sine(3.0 * PI / 2.0).writeln; // -1
	tangent(PI / 4.0).writeln; // 1
}
