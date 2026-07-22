# Linux Day 03 - mkdir, touch, head

## 1. mkdir (Make Directory)

### Definition
`mkdir` is a Linux command used to create one or more empty directories.

### Syntax

```bash
mkdir directory_name
```

### Examples

Create one directory

```bash
mkdir project
```

Create multiple directories

```bash
mkdir project1 project2 project3
```

Create nested directories

```bash
mkdir -p project/sql/scripts
```

### Common Options

| Option | Description |
|---------|-------------|
| -p | Creates parent and nested directories if they don't exist |
| -v | Displays a message for every directory created |

### Real-world Data Engineering Example

```bash
mkdir -p data/raw
mkdir -p data/processed
mkdir -p logs
```

Creates a folder structure for a data pipeline.

---

# 2. touch

### Definition

`touch` is used to create empty files or update timestamps of existing files.

### Syntax

```bash
touch filename
```

### Examples

Create a file

```bash
touch employees.csv
```

Create multiple files

```bash
touch employees.csv departments.csv salary.csv
```

Update timestamp

```bash
touch employees.csv
```

Set a specific timestamp

```bash
touch -t 202607221729.52 employees.csv
```

### Common Options

| Option | Description |
|---------|-------------|
| -t | Sets a custom timestamp |
| -a | Updates only access time |
| -m | Updates only modification time |

### Real-world Data Engineering Example

```bash
touch input.csv
```

Creates a sample file for testing an ETL pipeline.

---

# 3. head

### Definition

`head` displays the first part of a file.

By default, it displays the first **10 lines**.

### Syntax

```bash
head filename
```

### Examples

First 10 lines

```bash
head employees.csv
```

First 20 lines

```bash
head -20 employees.csv
```

Using -n

```bash
head -n 5 employees.csv
```

### Common Options

| Option | Description |
|---------|-------------|
| -n | Displays specified number of lines |
| -c | Displays specified number of bytes |

### Real-world Data Engineering Example

Before loading a CSV into a database, verify the header and first few records.

```bash
head employees.csv
```

---

# Interview Questions

### Q1. What does mkdir do?

Creates one or more empty directories.

---

### Q2. What does mkdir -p do?

Creates parent and nested directories if they do not exist.

Example:

```bash
mkdir -p project/sql/scripts
```

---

### Q3. Difference between:

```bash
mkdir project
```

and

```bash
mkdir project1 project2 project3
```

- First command creates one directory.
- Second command creates multiple directories.

---

### Q4. What does touch do?

Creates empty files or updates timestamps of existing files.

---

### Q5. What happens if the file already exists?

The file is not overwritten.

Its timestamp is updated.

---

### Q6. How do you create multiple files?

```bash
touch employees.csv departments.csv salary.csv
```

---

### Q7. What is touch -t used for?

Sets a custom timestamp.

Example:

```bash
touch -t 202607221729.52 employees.csv
```

---

### Q8. What does head do?

Displays the first few lines of a file.

By default, the first 10 lines.

---

### Q9. Difference between

```bash
head employees.csv
```

and

```bash
head -20 employees.csv
```

- `head` → first 10 lines
- `head -20` → first 20 lines

---

### Q10. When should you use head?

Use `head` to quickly inspect the beginning of a file, such as checking CSV headers or verifying the first few records before processing.

---

# Commands Learned So Far

```bash
pwd
ls
cd
mkdir
touch
head
```

---

# GitHub Commit

```bash
git add .
git commit -m "Add Linux Day 03 mkdir touch head notes"
git push
```