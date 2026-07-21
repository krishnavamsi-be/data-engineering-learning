# Linux Day 01 - Linux Fundamentals

**Date:** 20-07-2026

---

# Topics Covered

- What is Linux?
- What is Unix?
- Unix History
- Linux Distributions
- Terminal Basics
- Shell
- Absolute vs Relative Paths
- man command
- --help option
- pwd command
- cd command
- ssh command

---

# 1. What is Linux?

Linux is an open-source, Unix-like operating system built around the Linux kernel. It manages hardware resources, memory, processes, files, and devices. Linux provides command-line and graphical interfaces and is widely used in servers, cloud computing, DevOps, and Data Engineering because of its stability, security, performance, and flexibility.

---

# 2. What is Unix?

Unix is a multi-user, multitasking operating system developed in 1969 at Bell Labs by Ken Thompson, Dennis Ritchie, and others. It became the foundation for many modern operating systems and is known for its stability, security, and portability.

---

# 3. Unix vs Linux

| Unix | Linux |
|------|-------|
| Developed at Bell Labs | Developed by Linus Torvalds |
| Mostly Commercial | Open Source |
| Original Operating System | Unix-like Operating System |
| Vendor specific | Community driven |

---

# 4. Linux Distribution

A Linux distribution (Linux Distro) is a complete operating system built around the Linux kernel.

A distribution contains:

- Linux Kernel
- GNU Utilities
- Libraries
- Package Manager
- Applications

Examples:

- Ubuntu
- Debian
- Red Hat Enterprise Linux (RHEL)
- Fedora
- Rocky Linux

---

# 5. Terminal

A Terminal is an application that allows users to interact with the operating system using commands.

Examples:

- GNOME Terminal
- Windows Terminal
- macOS Terminal

---

# 6. Shell

A Shell is a command-line interpreter that accepts commands from the user, interprets them, and communicates with the Linux kernel.

Common Shells:

- Bash
- Zsh
- Sh
- Ksh

Flow:

User → Terminal → Shell → Linux Kernel → Hardware

---

# 7. Absolute Path vs Relative Path

## Absolute Path

- Starts from the root directory (/)
- Always the complete path

Example:

/home/krishna/projects/sql/Day01.sql

---

## Relative Path

- Starts from the current working directory

Example:

Day01.sql

or

./Day01.sql

---

# 8. man Command

Used to display the complete manual page of a command.

Syntax:

man <command>

Example:

man ls

---

# 9. --help Option

Displays a quick summary of a command including syntax and available options.

Example:

ls --help

Difference:

man → Detailed documentation

--help → Quick reference

---

# 10. pwd Command

Full Form:

Print Working Directory

Purpose:

Displays the absolute path of the current working directory.

Example:

pwd

Output:

/home/krishna/projects/sql

---

# 11. cd Command

Full Form:

Change Directory

Purpose:

Used to navigate between directories.

Examples:

Go to Home Directory

cd

Move One Level Up

cd ..

Go to Specific Directory

cd /home/krishna/projects

Go Using Relative Path

cd sql

---

# 12. SSH

SSH (Secure Shell) is a secure network protocol used to remotely access and manage another computer over an encrypted connection.

Syntax:

ssh username@hostname

Example:

ssh krishna@192.168.1.10

SSH Process:

1. Verify server identity
2. Authenticate the user
3. Create an encrypted communication channel
4. Provide secure remote shell access

Advantages:

- Secure communication
- Remote administration
- File transfer (SCP/SFTP)
- Authentication using Password or SSH Keys

SSH is preferred over Telnet because SSH encrypts data while Telnet sends data in plain text.

---

# Interview Questions

1. What is Linux?

2. Difference between Unix and Linux?

3. What is a Linux Distribution?

4. Difference between Terminal and Shell?

5. Difference between Absolute Path and Relative Path?

6. Difference between man and --help?

7. What is pwd?

8. Difference between cd and cd ..?

9. What is SSH?

10. Why is Linux important for Data Engineers?

---

# Commands Learned Today

```bash
man
pwd
cd
ssh
```

---

# Day 01 Summary

✅ Linux Basics

✅ Unix Basics

✅ Unix History

✅ Linux Distributions

✅ Terminal

✅ Shell

✅ Paths

✅ man

✅ --help

✅ pwd

✅ cd

✅ SSH