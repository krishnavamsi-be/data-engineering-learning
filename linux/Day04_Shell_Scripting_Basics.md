# Day 04 - Shell Scripting Basics

**Date:** 2026-07-24

---

# Topics Covered

- echo command
- read command
- Variables
- if statement
- if...else statement
- if...elif...else statement

---

# What is a Shell Script?

A shell script is a file containing a sequence of Linux commands that are executed one after another by the shell.

Shell scripts help automate repetitive tasks.

Example:

```bash
#!/bin/bash

echo "Hello World"
```

---

# echo Command

## Purpose

The `echo` command is used to print text or variable values to the terminal.

## Syntax

```bash
echo "message"
```

## Examples

Print text:

```bash
echo "Hello World"
```

Output

```
Hello World
```

Print variable value:

```bash
name="Krishna"

echo $name
```

Output

```
Krishna
```

---

# read Command

## Purpose

The `read` command is used to accept input from the user while the script is running.

## Syntax

```bash
read variable_name
```

Example

```bash
#!/bin/bash

echo "Enter your name"

read name

echo "Welcome $name"
```

Output

```
Enter your name
Krishna

Welcome Krishna
```

---

# Variables

## What is a Variable?

A variable is a named storage location used to store data that can be reused throughout the script.

## Syntax

```bash
variable_name=value
```

Example

```bash
name="Krishna"

city="Hyderabad"

echo $name

echo $city
```

Output

```
Krishna

Hyderabad
```

---

# Rules for Variables

Correct

```bash
name="Krishna"
```

Wrong

```bash
name = "Krishna"
```

Reason:

Spaces are NOT allowed around '='.

---

# if Statement

Used when only one condition needs to be checked.

Syntax

```bash
if [ condition ]
then
    commands
fi
```

Example

```bash
#!/bin/bash

echo "Enter a number"

read number

if [ $number -gt 100 ]
then
    echo "Greater than 100"
fi
```

---

# if...else Statement

Used when there are two possible outcomes.

Syntax

```bash
if [ condition ]
then
    commands
else
    commands
fi
```

Example

```bash
#!/bin/bash

echo "Enter your age"

read age

if [ $age -ge 18 ]
then
    echo "Eligible to vote"
else
    echo "Not Eligible to vote"
fi
```

---

# if...elif...else Statement

Used when multiple conditions need to be checked.

Syntax

```bash
if [ condition ]
then
    commands

elif [ condition ]
then
    commands

else
    commands
fi
```

Example

```bash
#!/bin/bash

echo "Enter Marks"

read marks

if [ $marks -ge 90 ]
then
    echo "Grade A"

elif [ $marks -ge 80 ]
then
    echo "Grade B"

elif [ $marks -ge 70 ]
then
    echo "Grade C"

else
    echo "Fail"
fi
```

---

# Numeric Comparison Operators

| Operator | Meaning |
|----------|---------|
| -eq | Equal to |
| -ne | Not equal to |
| -gt | Greater than |
| -lt | Less than |
| -ge | Greater than or equal to |
| -le | Less than or equal to |

Example

```bash
if [ $age -ge 18 ]
```

---

# String Comparison

```bash
if [ "$name" = "Krishna" ]
then
    echo "Welcome Krishna"
fi
```

---

# Common Interview Questions

### What is the difference between echo and read?

echo prints output to the terminal.

read accepts input from the user.

---

### What is a variable?

A variable is a named memory location used to store values that can be reused in a shell script.

---

### Difference between if, if...else and if...elif...else?

if

- One condition

if...else

- Two possible outcomes

if...elif...else

- Multiple conditions

---

### Why do we use '$' before a variable?

The `$` symbol is used to access the value stored inside a variable.

Example

```bash
name="Krishna"

echo $name
```

---

# Common Mistakes

❌ Wrong

```bash
name = Krishna
```

✅ Correct

```bash
name="Krishna"
```

---

❌ Wrong

```bash
if [age -ge 18]
```

✅ Correct

```bash
if [ $age -ge 18 ]
```

---

❌ Wrong

```bash
if [environment -eq "dev"]
```

✅ Correct

```bash
if [ "$environment" = "dev" ]
```

Reason:

`-eq` is used only for numeric comparison.

Use `=` for string comparison.

---

# Practice Programs

## Program 1

Read a user's name and display a welcome message.

## Program 2

Check whether a number is greater than 100.

## Program 3

Check voting eligibility.

## Program 4

Display student grade using if...elif...else.

## Program 5

Ask for environment name (dev/test/prod) and print the environment type.

---

# Revision Summary

Topics Completed

- echo
- read
- Variables
- if
- if...else
- if...elif...else

Current Linux Progress

Day 01

- pwd
- ls
- cd

Day 02

- mkdir
- touch

Day 03

- head
- whereis

Day 04

- echo
- read
- Variables
- if
- if...else
- if...elif...else

---

# Linux Day 04 Assessment

**Score:** 12.5 / 15

### Strengths

- Good understanding of shell scripting concepts.
- Comfortable with variables and decision-making statements.
- Can write simple interactive scripts.

### Areas to Improve

- Remember to use `$` when accessing variables.
- No spaces around `=` in variable assignment.
- Leave spaces inside `[ ]` in conditions.
- Use numeric operators (`-gt`, `-ge`, etc.) only for numbers.
- Use `=` for string comparisons.

---

# Git Commands

```bash
git status
git add .
git commit -m "Add Linux Day 04 shell scripting basics"
git push
```