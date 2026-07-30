# Linux Learning - Day 07

**Date:** 30 July 2026

## Topics Covered

- `wc` command
- `nl` command
- `whereis` command
- `date` command
- `whoami` command
- `tail` command
- Linux File System

---

# 1. wc (Word Count)

The `wc` command is used to count the number of lines, words, characters, and bytes in a file.

## Syntax

```bash
wc [option] filename
```

## Common Options

| Command | Description |
|---------|-------------|
| `wc file.txt` | Displays lines, words, and bytes |
| `wc -l file.txt` | Count number of lines |
| `wc -w file.txt` | Count number of words |
| `wc -c file.txt` | Count bytes |
| `wc -m file.txt` | Count characters |

## Example

```bash
wc employees.txt
```

Output

```
15 120 845 employees.txt
```

Meaning:

- 15 Lines
- 120 Words
- 845 Bytes

---

# 2. nl (Number Lines)

The `nl` command displays file contents with line numbers.

## Syntax

```bash
nl filename
```

## Example

```bash
nl employees.txt
```

Output

```
1  Krishna
2  Rahul
3  John
```

Useful while debugging configuration files or scripts.

---

# 3. whereis

The `whereis` command locates the binary, source code, and manual page of a command.

## Syntax

```bash
whereis command
```

## Example

```bash
whereis python
```

Output

```
python: /usr/bin/python3 /usr/share/man/man1/python.1.gz
```

Useful for locating installed programs.

---

# 4. date

The `date` command displays the current system date and time.

## Syntax

```bash
date
```

## Example

```bash
date
```

Output

```
Thu Jul 30 12:15:10 IST 2026
```

Useful Options

```bash
date +"%d-%m-%Y"
```

```
30-07-2026
```

```bash
date +"%H:%M:%S"
```

```
12:15:10
```

---

# 5. whoami

Displays the username of the currently logged-in user.

## Syntax

```bash
whoami
```

Example

```
krishna
```

Useful for checking the current user, especially after switching users using `su` or `sudo`.

---

# 6. tail

Displays the last few lines of a file.

## Syntax

```bash
tail filename
```

Example

```bash
tail employees.txt
```

Shows the last 10 lines by default.

### Display Last 5 Lines

```bash
tail -5 employees.txt
```

### Monitor a Log File Continuously

```bash
tail -f application.log
```

Very useful for monitoring application logs in production environments.

---

# 7. Linux File System

Linux uses a hierarchical directory structure that starts from the root directory (`/`).

```
/
├── bin
├── boot
├── dev
├── etc
├── home
├── lib
├── media
├── mnt
├── opt
├── proc
├── root
├── run
├── sbin
├── srv
├── sys
├── tmp
├── usr
└── var
```

## Important Directories

| Directory | Purpose |
|-----------|---------|
| `/` | Root directory |
| `/home` | User home directories |
| `/root` | Home directory of the root user |
| `/etc` | Configuration files |
| `/bin` | Essential user commands |
| `/sbin` | System administration commands |
| `/usr` | User programs and utilities |
| `/var` | Log files and variable data |
| `/tmp` | Temporary files |
| `/boot` | Boot loader files |
| `/dev` | Device files |
| `/proc` | Process information |
| `/media` | Mounted removable devices |
| `/mnt` | Temporary mount point |

---

# Interview Questions

### What is the difference between `wc -c` and `wc -m`?

- `wc -c` counts bytes.
- `wc -m` counts characters.

---

### What does `tail -f` do?

It continuously displays new lines added to a file, making it useful for monitoring log files in real time.

---

### What is the purpose of `whereis`?

It locates the binary executable, source files, and manual pages of a command.

---

### Where are Linux configuration files stored?

Most Linux configuration files are stored inside the `/etc` directory.

---

### Which directory contains user home folders?

```
/home
```

---

# Real-World Data Engineering Usage

- Use `tail -f` to monitor ETL and Spark application logs.
- Use `wc` to verify record counts after processing data.
- Use `whereis` to locate installed software like Python or Java.
- Use `whoami` to confirm the current execution user.
- Use `date` in shell scripts for timestamps and log file names.
- Understanding the Linux file system helps locate configuration files, logs, scripts, and data.

---

# Commands Practiced

```bash
wc employees.txt
wc -l employees.txt
wc -w employees.txt
wc -c employees.txt

nl employees.txt

whereis python

date
date +"%d-%m-%Y"
date +"%H:%M:%S"

whoami

tail employees.txt
tail -5 employees.txt
tail -f application.log
```

---

## Day 07 Summary

✅ Learned `wc`, `nl`, `whereis`, `date`, `whoami`, `tail`, and the Linux file system.

These commands are commonly used by Data Engineers for monitoring logs, verifying data, locating executables, checking system information, and navigating Linux servers.