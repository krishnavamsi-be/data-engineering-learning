Yep bro. Since this is going straight into your GitHub README.md, here's a clean version based on exactly what we learned today — beginner-friendly, but still useful later when you revisit it.

Linux Cron / Crontab Notes
Linux Cron / Crontab

My notes and hands-on practice while learning Linux cron and crontab.

1. What is Cron?

Cron is a Linux scheduler.

It allows us to run commands or scripts automatically at a specific time.

Example:

* * * * * echo "Hello"


This runs the command every minute.

Cron daemon

The cron daemon is a background Linux process that continuously checks the time and runs scheduled cron jobs when their time arrives.

2. What is Crontab?

crontab is used to create and manage scheduled cron jobs.

List current cron jobs
crontab -l

Edit cron jobs
crontab -e


When editing the crontab, a typical entry looks like:

* * * * * command

3. Cron Schedule Syntax

Cron uses 5 time fields + a command.

MINUTE HOUR DAY-OF-MONTH MONTH DAY-OF-WEEK COMMAND


Example:

* * * * * echo "Hello"


The five fields are:

MINUTE       0-59
HOUR         0-23
DAY-OF-MONTH 1-31
MONTH        1-12
DAY-OF-WEEK  0-7


Usually:

0 = Sunday
1 = Monday
2 = Tuesday
3 = Wednesday
4 = Thursday
5 = Friday
6 = Saturday


7 can also represent Sunday on common cron implementations.

4. What does * mean?

* means any/all values for that field.

Example:

* * * * * command


Means:

every minute
every hour
every day
every month
every day of the week

Therefore, the command runs every minute.

5. Important Difference: 5 vs */5

These are NOT the same.

5 * * * *
At minute 5 of every hour.


Examples:

10:05
11:05
12:05
13:05

*/5 * * * *
Every 5 minutes.


Examples:

10:00
10:05
10:10
10:15
10:20


*/5 means every 5 units.

Other examples:

*/10   = every 10
*/15   = every 15
*/30   = every 30

6. Common Scheduling Examples
Every minute
* * * * * command

Every 5 minutes
*/5 * * * * command

Every 10 minutes
*/10 * * * * command

Every day at 10:30 AM
30 10 * * * command

Every day at 5:30 PM
30 17 * * * command


Cron uses the 24-hour clock.

10:30 AM = 30 10
5:30 PM  = 30 17

Every Monday at 9:00 AM
0 9 * * 1 command

January 21 at 5:35 PM
35 17 21 1 * command


The * in the last field means we don't care which day of the week it is.

7. Cron Syntax Errors

A cron job needs:

5 schedule fields + command


Correct:

* * * * * echo "Hello"


Incorrect:

* * * echo "Hello"


The incorrect example has only 3 schedule fields.

Cron cannot understand the schedule, so the entry is rejected.

Important concept

Cron understands WHEN to run the command.

The shell interprets and executes the command.

Simple flow:

crontab
   ↓
cron daemon
   ↓
checks schedule
   ↓
time matches
   ↓
command is started
   ↓
shell executes command

8. Cron Environment

Cron does not necessarily have the same environment as my normal terminal.

For example, a command may work manually:

python3 script.py


but fail from cron because the cron environment may have a different PATH or missing environment variables.

Use absolute paths

Instead of:

python3 script.py


prefer:

/usr/bin/python3 /home/user/script.py


Check the location of a command with:

which python3


Example:

which python3


Output might be:

/usr/bin/python3

Important
Normal terminal environment != Cron environment


Cron jobs should be explicit about:

command paths
script paths
required environment variables
working directories
9. Redirecting Output and Logs

Cron jobs usually run in the background.

Because of this, we often redirect the command's output to a log file.

Linux has standard streams:

0 = standard input
1 = standard output
2 = standard error

> — Overwrite
command > /tmp/cron.log


Sends normal output to the file.

If the file already exists, its previous contents are overwritten.

Example:

echo "Hello" > /tmp/cron.log

>> — Append
command >> /tmp/cron.log


Sends normal output to the file and adds it to the end.

Example:

echo "Hello" >> /tmp/cron.log


For cron jobs, >> is useful when we want to keep previous log entries.

2> — Redirect Errors
command 2> /tmp/error.log


The 2 represents standard error.

Example:

ls /does-not-exist 2> /tmp/error.log


The error is written to:

/tmp/error.log

2>&1 — Combine Output and Errors
command >> /tmp/cron.log 2>&1


This means:

normal output → cron.log
errors        → cron.log


So both standard output and standard error go into the same file.

This is a very common pattern for cron jobs.

10. Cron Logging Example

A practical cron job:

* * * * * echo "Cron ran at $(date)" >> /tmp/cron.log 2>&1


Every minute:

Cron runs the command.
date gets the current date/time.
The message is appended to /tmp/cron.log.
Any errors are also redirected to the same log.

Check the log:

cat /tmp/cron.log


Or watch it:

tail -f /tmp/cron.log

11. Important Cron Considerations

When creating cron jobs, remember:

1. Use absolute paths
/home/user/script.sh


is safer than:

script.sh

2. Remember the environment

Cron may not have the same PATH and environment variables as my terminal.

3. Redirect output and errors

Example:

>> /tmp/cron.log 2>&1

4. Check permissions

The cron job runs as a particular user.

That user needs permission to:

execute the script
read required files
write to required directories
5. Avoid overlapping jobs

For example, if a job runs every 5 minutes but takes 20 minutes to finish, multiple instances could run at the same time.

6. Keep logs

Logs help with troubleshooting when a scheduled job fails.

12. Commands I Practiced
List cron jobs
crontab -l

Edit cron jobs
crontab -e

Create a simple cron job
* * * * * echo "Hello from cron"

Redirect output
echo "Hello Cron" >> /tmp/cron.log

Read the log
cat /tmp/cron.log

Find command path
which python3

13. Quick Cheat Sheet
CRON
↓
Linux scheduler

CRON DAEMON
↓
Background process that checks schedules and runs jobs

CRONTAB
↓
Used to create/manage cron jobs

Five fields
* * * * * command
│ │ │ │ │
│ │ │ │ └── Day of week
│ │ │ └──── Month
│ │ └────── Day of month
│ └──────── Hour
└────────── Minute

Redirection
>      overwrite output
>>     append output
2>     redirect errors
2>&1   combine output + errors

Most important concept
Cron = WHEN
Shell = HOW
s