# Day 06 - Linux Permissions & Ownership

**Date:** 2026-07-26

---

# Topics Covered

Today I learned the following Linux commands:

- chmod
- chown
- chgrp

Options covered:

- -R (Recursive)
- -v (Verbose)
- -c (Changes Only)

---

# Why Are File Permissions Important?

Linux uses permissions to control:

- Who can read a file
- Who can write to a file
- Who can execute a file

Permissions help protect files from unauthorized access and accidental modifications.

---

# chmod

## Purpose

The `chmod` command is used to change the permissions of a file or directory.

## Syntax

```bash
chmod [options] permissions file_name
```

Examples

```bash
chmod 755 script.sh
```

```bash
chmod +x script.sh
```

### Real-world Example

Before running an ETL shell script, make it executable.

```bash
chmod +x etl.sh
```

---

# chown

## Purpose

The `chown` command is used to change the owner of a file or directory.

It can also change both the owner and the group together.

## Syntax

```bash
chown owner file_name
```

Example

```bash
chown krishna sales.csv
```

Change both owner and group

```bash
chown krishna:dataeng sales.csv
```

### Real-world Example

Assign ownership of project files to a specific user.

---

# chgrp

## Purpose

The `chgrp` command is used to change the group ownership of a file or directory.

## Syntax

```bash
chgrp group_name file_name
```

Example

```bash
chgrp dataeng sales.csv
```

### Real-world Example

Allow all members of the Data Engineering team to access shared files.

---

# Common Options

## -R (Recursive)

### Meaning

Applies the command to a directory and all files and subdirectories inside it.

Example

```bash
chmod -R 755 project/
```

```bash
chown -R etluser project/
```

```bash
chgrp -R dataeng project/
```

---

## -v (Verbose)

### Meaning

Displays every file or directory being processed.

Example

```bash
chmod -v 755 script.sh
```

Sample Output

```
mode of 'script.sh' changed from 644 to 755
```

---

## -c (Changes Only)

### Meaning

Displays output only when a change has actually been made.

Example

```bash
chmod -c 755 script.sh
```

If no changes are made, no output is displayed.

---

# Difference Between Commands

| Command | Purpose |
|----------|---------|
| chmod | Change file or directory permissions |
| chown | Change file or directory owner |
| chgrp | Change group ownership |

---

# Common Interview Questions

## 1. What is chmod used for?

It changes the permissions of a file or directory.

---

## 2. What is chown used for?

It changes the owner of a file or directory.

---

## 3. What is chgrp used for?

It changes the group ownership of a file or directory.

---

## 4. What does -R mean?

Recursive.

It applies the command to all files and subdirectories inside a directory.

---

## 5. What does -v mean?

Verbose.

It displays every file or directory being processed.

---

## 6. What does -c mean?

Changes Only.

It displays output only if a change has actually occurred.

---

## 7. Difference between chmod, chown and chgrp?

- chmod changes permissions.
- chown changes the owner.
- chgrp changes the group ownership.

---

# Common Mistakes

❌ Forgetting `-R` while changing permissions for an entire directory.

Correct:

```bash
chmod -R 755 project/
```

---

❌ Using `chgrp` to change the owner.

Correct:

```bash
chown krishna sales.csv
```

---

❌ Using `-v` when you only want to display changes.

Correct:

```bash
chmod -c 755 script.sh
```

---

# Real-World Data Engineering Examples

### Make an ETL script executable

```bash
chmod +x etl.sh
```

---

### Change ownership of a project

```bash
chown -R etluser project/
```

---

### Change group ownership of shared files

```bash
chgrp dataeng sales.csv
```

---

# Revision Summary

Today I learned:

- chmod
- chown
- chgrp
- Recursive option (-R)
- Verbose option (-v)
- Changes Only option (-c)

These commands are commonly used to manage file permissions and ownership in Linux systems.

---

# Assessment

**Score:** 12.5 / 15

### Strengths

- Understood the purpose of chmod, chown and chgrp.
- Correctly explained recursive operations.
- Good understanding of verbose output.

### Areas to Improve

- Remember when to use `-c` instead of `-v`.
- Use `-R` for recursive ownership changes.
- Differentiate between owner and group ownership.

---

# Git Commands

```bash
git status

git add .

git commit -m "Add Linux Day 06 permissions and ownership"

git push
```