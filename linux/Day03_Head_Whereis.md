# Linux Day 03 - head & whereis

**Author:** Krishna Vamsi

---

# 1. head Command

## What is head?

The `head` command is used to display the first few lines of a file.

By default, it displays the **first 10 lines**.

---

## Syntax

```bash
head filename
```

Example:

```bash
head employees.txt
```

---

## Display First N Lines

Display first 5 lines

```bash
head -5 employees.txt
```

Display first 15 lines

```bash
head -15 employees.txt
```

Display first 20 lines

```bash
head -20 employees.txt
```

---

## Common Options

| Command | Description |
|----------|-------------|
| `head file.txt` | Displays first 10 lines (default) |
| `head -5 file.txt` | Displays first 5 lines |
| `head -15 file.txt` | Displays first 15 lines |
| `head -20 file.txt` | Displays first 20 lines |

---

## Real-World Data Engineering Use Case

Data Engineers frequently work with huge log files.

Instead of opening the complete file, use `head` to quickly inspect the beginning of the file.

Example:

```bash
head etl.log
```

---

# 2. whereis Command

## What is whereis?

The `whereis` command is used to locate:

- Binary (Executable) file
- Source files (if available)
- Manual pages

of a command in the Linux file system.

---

## Syntax

```bash
whereis command_name
```

Example:

```bash
whereis python
```

Possible Output:

```text
python: /usr/bin/python3 /usr/share/man/man1/python.1.gz
```

---

## Common Examples

Locate Python

```bash
whereis python
```

Locate ls command

```bash
whereis ls
```

Locate only binary file

```bash
whereis -b python
```

Locate only manual page

```bash
whereis -m python
```

---

## Common Options

| Command | Description |
|----------|-------------|
| `whereis python` | Displays binary, source and manual page |
| `whereis -b python` | Displays only binary |
| `whereis -m python` | Displays only manual page |

---

## Difference Between whereis and which

| whereis | which |
|----------|-------|
| Finds binary, source files and manual pages | Finds the executable currently being used |
| Can return multiple locations | Usually returns one executable path |

Example:

```bash
whereis python
```

```bash
which python
```

---

## Real-World Data Engineering Use Case

Suppose a Linux server has multiple Python installations.

Use:

```bash
whereis python
```

to locate the installed Python binaries and their manual pages.

---

# Interview Questions

1. What is the purpose of the `head` command?

2. How many lines does `head` display by default?

3. How do you display the first 15 lines of a file?

4. Why is `head` useful when working with large log files?

5. What information does the `whereis` command provide?

6. What is the difference between `whereis` and `which`?

7. What do the `-b` and `-m` options do in `whereis`?

8. How can `whereis` help when multiple Python versions are installed?

---

# Commands Learned So Far

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

---

# Quick Revision

## head

- Displays the beginning of a file
- Default: first 10 lines
- Useful for viewing large files quickly

Common Commands

```bash
head employees.txt
head -5 employees.txt
head -15 employees.txt
head -20 employees.txt
```

---

## whereis

- Finds binary location
- Finds source files
- Finds manual pages

Common Commands

```bash
whereis python
whereis ls
whereis -b python
whereis -m python
```

---

# Git Commands

```bash
git add .

git commit -m "Add Linux Day 03 head and whereis notes"

git push
```