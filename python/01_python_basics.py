Sure. Since you're maintaining your learning as a Notepad .txt file, I'd make the first Python file a clean reference of everything you've learned so far.

Save it as:

01_python_basics.txt

Python Basics
PYTHON BASICS
VARIABLES

A variable is used to store a value.

Example:

name = "Krishna"
age = 25
salary = 50000.50

print(name)
print(age)
print(salary)

COMMENTS

Comments are used to explain code. Python ignores comments while executing the program.

Single-line comment:

This is a comment

Example:

Store the person's age

age = 25

DATA TYPES

Common Python data types:

int -> Integer numbers
float -> Decimal numbers
str -> Text/String
bool -> True or False

Examples:

age = 25
price = 99.50
name = "Krishna"
is_active = True

print(type(age))
print(type(price))
print(type(name))
print(type(is_active))

INTEGER (int)

Used for whole numbers.

Example:

age = 25
year = 2026
count = 100

print(type(age))

FLOAT (float)

Used for decimal numbers.

Example:

salary = 50000.50
height = 5.9
price = 99.99

print(type(salary))

STRING (str)

Used for text.

Strings can be written using single quotes or double quotes.

Example:

name = "Krishna"
city = 'Visakhapatnam'

print(name)
print(city)

BOOLEAN (bool)

Boolean values can be either True or False.

Example:

is_student = True
is_logged_in = False

print(is_student)
print(is_logged_in)

TYPE CASTING

Type casting means converting a value from one data type to another.

String to integer:

x = "100"
y = int(x)

print(y)
print(type(y))

Integer to string:

x = 100
y = str(x)

print(y)
print(type(y))

String to float:

x = "99.50"
y = float(x)

print(y)
print(type(y))

Float to integer:

x = 99.99
y = int(x)

print(y)

IMPORTANT:

When converting float to int, the decimal part is removed.

Example:

int(99.99)

Output:

99

COMPARISON OPERATORS

Comparison operators compare two values.

== Equal to
!= Not equal to

Greater than


< Less than

= Greater than or equal to
<= Less than or equal to

Examples:

x = 10
y = 20

print(x == y)
print(x != y)
print(x > y)
print(x < y)
print(x >= y)
print(x <= y)

Comparison operations return either:

True
or
False

LOGICAL OPERATORS

Python has three main logical operators:

and
or
not

AND

Returns True only when both conditions are True.

Example:

x = 10

print(x > 5 and x < 20)

Output:

True

OR

Returns True when at least one condition is True.

Example:

x = 10

print(x > 20 or x == 10)

Output:

True

NOT

Reverses the result.

Example:

x = 10

print(not(x > 5))

Output:

False

MEMBERSHIP OPERATORS

Membership operators are used to check whether a value exists inside a sequence such as a string.

The main membership operators are:

in
not in

IN

Example:

name = "Krishna"

print("K" in name)

Output:

True

NOT IN

Example:

name = "Krishna"

print("z" not in name)

Output:

True

Another example:

name = "Python"

print("P" in name)
print("z" in name)

Output:

True
False

COMBINING OPERATORS

We can combine comparison operators with logical operators.

Example:

age = 25

print(age >= 18 and age <= 60)

Output:

True

Another example:

name = "Krishna"
age = 25

print(name == "Krishna" and age > 20)

Output:

True

IMPORTANT EXAMPLES

Example 1:

x = 10
y = 20

print(x > 5 and y > 15)

Output:

True

Example 2:

x = 10
y = 20

print(x > 15 or y > 15)

Output:

True

Example 3:

x = "100"
y = int(x)

print(type(x))
print(type(y))
print(y + 50)

Output:

<class 'str'>
<class 'int'>
150

Example 4:

a = 10
b = 10.0

print(a == b)

Output:

True

Note:

10 and 10.0 have different data types, but their numeric values are equal.

QUICK REVISION

Variables:
Used to store values.

int:
Whole numbers.

float:
Decimal numbers.

str:
Text.

bool:
True or False.

Type casting:
Converting one data type into another.

Comparison operators:
==, !=, >, <, >=, <=

Logical operators:
and, or, not

Membership operators:
in, not in

WHAT I LEARNED

I practiced:

Variables
Comments
int
float
string
boolean
Type casting
Comparison operators
and
or
not
in
not in
Combining comparison and logical operators
NEXT TOPIC

if
elif
else