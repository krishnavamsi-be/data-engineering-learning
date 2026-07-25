# Day 05 - Linux Revision

**Date:** 2026-07-25

---

# Purpose

Today was a revision day.

The goal was to revise all Linux concepts learned so far instead of learning new commands.

---

# Linux Progress

## Day 01

- pwd
- ls
- cd

## Day 02

- mkdir
- touch

## Day 03

- head
- whereis

## Day 04

- echo
- read
- Variables
- if
- if...else
- if...elif...else

---

# Revision Notes

## pwd

### Purpose

Displays the current working directory.

### Syntax

```bash
pwd
```

Example

```bash
$ pwd

/home/krishna/projects
```

---

## ls

### Purpose

Lists files and directories.

### Syntax

```bash
ls
```

Useful Options

```bash
ls -l
ls -a
ls -la
```

---

## cd

### Purpose

Changes the current directory.

### Syntax

```bash
cd directory_name
```

Examples

```bash
cd Documents

cd ..

cd ~
```

---

## mkdir

### Purpose

Creates a new directory.

### Syntax

```bash
mkdir project
```

Example

```bash
mkdir data-engineering
```

---

## touch

### Purpose

Creates an empty file or updates a file's timestamp.

### Syntax

```bash
touch filename
```

Example

```bash
touch employees.csv
```

---

## head

### Purpose

Displays the first lines of a file.

### Syntax

```bash
head filename
```

Useful Option

```bash
head -5 logfile.log
```

---

## whereis

### Purpose

Locates the binary, source and manual page of a command.

### Syntax

```bash
whereis python
```

Example

```bash
whereis bash
```

---

## echo

### Purpose

Prints text or variable values.

### Syntax

```bash
echo "Hello World"
```

Example

```bash
name="Krishna"

echo $name
```

Output

```
Krishna
```

---

## read

### Purpose

Reads input from the user.

### Syntax

```bash
read variable_name
```

Example

```bash
echo "Enter your name"

read name

echo "Welcome $name"
```

---

## Variables

### Purpose

Store reusable values.

### Syntax

```bash
name="Krishna"
```

Access Variable

```bash
echo $name
```

---

## if Statement

Used when only one condition needs to be checked.

Example

```bash
if [ $age -ge 18 ]
then
    echo "Eligible"
fi
```

---

## if...else

Used when there are two possible outcomes.

Example

```bash
if [ $marks -ge 35 ]
then
    echo "Pass"
else
    echo "Fail"
fi
```

---

## if...elif...else

Used when multiple conditions need to be checked.

Example

```bash
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

# Important Comparison Operators

## Numeric Operators

| Operator | Meaning |
|----------|---------|
| -eq | Equal |
| -ne | Not Equal |
| -gt | Greater Than |
| -lt | Less Than |
| -ge | Greater Than or Equal |
| -le | Less Than or Equal |

---

## String Comparison

```bash
if [ "$name" = "Krishna" ]
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

---

# Real-World Data Engineering Uses

| Command | Example Use |
|----------|-------------|
| pwd | Verify current project directory |
| ls | List ETL scripts and files |
| cd | Navigate between project folders |
| mkdir | Create new project folders |
| touch | Create configuration or script files |
| head | Preview the first few rows of a data file |
| whereis | Locate installed tools like Python |
| echo | Print logs or debugging messages |
| read | Accept user input in shell scripts |
| Variables | Store file paths and configuration values |
| if | Execute tasks based on conditions |

---

# Interview Questions

### What is the difference between echo and read?

echo prints output.

read accepts user input.

---

### Difference between if and if...else?

if executes code only when a condition is true.

if...else executes one block if true and another if false.

---

### Why do we use variables?

To store reusable values and avoid hardcoding.

---

### Why do we use head?

To quickly inspect the beginning of large files without opening the entire file.

---

### What does whereis do?

It finds the binary, source code and manual page for a command.

---

# Revision Summary

Today's goal was revision, not learning new commands.

I reviewed:

- Basic navigation commands
- File and directory commands
- head
- whereis
- echo
- read
- Variables
- if
- if...else
- if...elif...else

---

# Git Commands

```bash
git status
git add .
git commit -m "Add Linux Day 05 revision notes"
git push
```