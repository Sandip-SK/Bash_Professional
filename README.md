# Bash for SRE and DevOps Engineers

## A Practical Shell Scripting Handbook for Operations Teams

> “The fastest way to understand a system is often to automate the check, log the symptom, and script the fix.”

This repository is designed like a book for engineers working in operations, reliability, platform engineering, cloud support, and DevOps. Each lesson builds a practical skill needed to monitor systems, automate routine tasks, investigate incidents, and improve service health with Bash.

Whether you are new to shell scripting or already comfortable with basic commands, this guide helps you move from simple commands to production-style automation.

---

## Who this is for

This course is ideal for:

- SRE engineers
- DevOps engineers
- platform engineers
- Linux administrators
- cloud support engineers
- developers who want stronger operational scripting skills

---

## Prerequisites

Before starting, make sure you are comfortable with:

- basic Linux command-line usage
- file and directory navigation
- text editors such as `nano`, `vim`, or `code`
- running scripts from the terminal

You do not need advanced Bash knowledge to start. The exercises are intentionally practical and beginner-friendly.

---

## Table of Contents

1. [Why Bash matters for SRE and DevOps](#why-bash-matters-for-sre-and-devops)
2. [How to use this repository](#how-to-use-this-repository)
3. [Learning path](#learning-path)
4. [Beginner track](#beginner-track)
5. [Intermediate track](#intermediate-track)
6. [Advanced track](#advanced-track)
7. [Daily SRE Command Cheat Sheet](#daily-sre-command-cheat-sheet)
8. [Core Bash concepts you should master](#core-bash-concepts-you-should-master)
9. [Suggested practice routine](#suggested-practice-routine)
10. [Example real-world exercises](#example-real-world-exercises)
11. [Tips for writing production-ready Bash scripts](#tips-for-writing-production-ready-bash-scripts)
12. [Recommended next steps](#recommended-next-steps)
13. [Repository structure](#repository-structure)

---

## Why Bash matters for SRE and DevOps

Bash is still one of the most important tools in an engineer's toolkit. It helps with:

- managing Linux and Unix systems
- writing automation scripts for deployment and maintenance
- checking service health and availability
- parsing logs and identifying incidents
- handling alerts, updates, and operational tasks
- integrating with CI/CD pipelines and infrastructure tooling

Whether you are debugging a failed service, checking server uptime, or automating a release workflow, Bash is often the fastest path from problem to solution.

---

## How to use this repository

Treat the lessons as chapters in a hands-on book.

1. Read the concept.
2. Open the matching script.
3. Run the script in a terminal.
4. Modify it to solve your own scenario.
5. Build your own operational scripts from the patterns you learn.

The goal is not to memorize syntax alone, but to become comfortable thinking in scripts that automate operational tasks.

---

## Learning path

### Beginner track

#### Chapter 1: Bash Foundations
Location: `Lesson1-Variables`

Focus:
- shell basics
- variables
- environment variables
- command substitution
- script execution patterns

This chapter teaches the language building blocks used in real automation work.

Key ideas:
- variable assignment and scope
- using environment values in scripts
- capturing command output and reusing it
- writing clean, readable shell scripts

#### Chapter 2: Conditionals and Loops
Location: `Lesson2-Conditionals`

Focus:
- `if`, `else`, `elif`
- `for` loops
- command-line arguments
- checking service status
- responding to conditions in automation

This chapter introduces logic used in real operations:
- checking if a service is running
- looping across servers or files
- deciding whether an action should run
- creating scripts that respond to success or failure

Example pattern:

```bash
for server in "$@"; do
    echo "Checking $server..."
    if ping -c 1 "$server" &>/dev/null; then
        echo "UP"
    else
        echo "DOWN"
    fi
done
```

This is the kind of logic SREs use to validate infrastructure and endpoints.

---

### Intermediate track

#### Chapter 3: Functions and Reusable Automation
Location: `Lesson3-Functions`

Focus:
- writing reusable shell functions
- modular script design
- service health checks
- improving maintainability and readability

In operational work, scripts become useful only when they are reusable. Functions help you avoid duplication and break tasks into smaller operational units.

Typical use cases:
- checking if a service is healthy
- restarting a process safely
- validating environment configuration
- preparing a pre-deployment health script

#### Chapter 4: Log Analysis and Troubleshooting with AWK
Location: `Lesson4-LogAnalysisUsingAWK`

Focus:
- analyzing logs with `awk`
- extracting data from log files
- identifying error patterns
- summarizing operational metrics

This is a core SRE skill. Most incidents begin with logs. You need to quickly answer:
- What failed?
- When did it fail?
- Which service or host is impacted?
- How many errors appeared?

This chapter introduces practical log investigation workflows used in production support.

---

### Advanced track

#### Chapter 5: Advanced Log Searching and Pattern Matching
Location: `Lesson5-LogAnalysisUsingGrep`

Focus:
- advanced use of `grep`
- matching patterns in logs
- filtering by severity, host, and status
- operational triage at scale

At the advanced stage, scripting is less about syntax and more about speed and precision. You need to find the right signal in noisy logs, isolate anomalies, and build repeatable investigation workflows.

This level prepares you for incident response, debugging production systems, and supporting large distributed environments.

---

## Daily SRE Command Cheat Sheet

These commands appear frequently in real-world infrastructure and incident workflows.

```bash
# Check connectivity
ping -c 1 google.com

# Show system uptime
uptime

# View disk usage
df -h

# Show memory usage
free -m

# Check running processes
ps aux | grep nginx

# Show service status
systemctl status nginx

# Start or restart a service
sudo systemctl restart nginx

# View recent logs for a service
journalctl -u nginx -n 50 --no-pager

# Search logs for errors
grep -iE "error|fail|exception" /var/log/syslog

# Search for a specific term in a file
grep -i "timeout" app.log

# Count occurrences
grep -c "ERROR" app.log

# Show the last 20 lines of a log file
tail -n 20 app.log

# Follow a log in real time
tail -f /var/log/syslog

# Check open ports
ss -tuln

# Check HTTP response headers
curl -I http://localhost

# Check if a directory exists
[ -d /var/log ] && echo "exists"

# Check if a file exists
[ -f /etc/nginx/nginx.conf ] && echo "config exists"

# Loop over servers
for host in web01 web02 web03; do ping -c 1 "$host" >/dev/null && echo "$host UP" || echo "$host DOWN"; done
```

This cheat sheet is a practical reference for daily troubleshooting and automation tasks.

---

## Core Bash concepts you should master

### 1. Variables and quoting
Learn how to store values and pass them safely through scripts.

```bash
name="web-01"
status=$(systemctl is-active nginx)
```

Use quotes properly to avoid issues with spaces and special characters.

### 2. Exit codes
Every command in Bash returns an exit status.

- `0` means success
- non-zero means failure

This is crucial for automation and health checks.

```bash
if command; then
    echo "Success"
else
    echo "Failure"
fi
```

### 3. Redirection
Redirection is used to control input and output streams.

```bash
ls > files.txt
grep "error" app.log 2>&1
```

`&>/dev/null` discards both standard output and standard error, which is useful when you want to silence a command while still checking its success/failure.

### 4. Control structures
These let scripts react to real conditions.

```bash
if [ -f /etc/nginx/nginx.conf ]; then
    echo "Config exists"
fi
```

### 5. Loops
Loops are essential when working with multiple servers, files, or services.

```bash
for host in web01 web02 web03; do
    echo "Checking $host"
done
```

### 6. Functions
Functions help you turn repeated actions into reusable logic.

```bash
check_service() {
    systemctl is-active "$1"
}
```

### 7. Text processing
SREs frequently need to parse logs, metrics, and config output.

Common tools:
- `grep`
- `awk`
- `sed`
- `cut`
- `sort`
- `uniq`

---

## Suggested practice routine

To become strong in Bash, practice in this order:

1. Write a script that prints system information.
2. Create a script that checks if a file or directory exists.
3. Loop over a list of servers and test connectivity.
4. Build a function to validate service health.
5. Search logs for errors and summarize findings.
6. Combine logic into a reusable operational script.

A good habit is to write scripts for real tasks you perform manually at work.

---

## Example real-world exercises

### Exercise 1: Server health check
Write a Bash script that checks several hosts and prints whether each is reachable.

### Exercise 2: Service validation
Check whether a service is active and print an actionable message.

### Exercise 3: Log error summary
Review a log file and count the number of errors or failed requests.

### Exercise 4: Deployment precheck
Confirm that required files and directories exist before running a deployment.

### Exercise 5: Automated incident triage
Parse logs and identify the affected service, time range, and failure pattern.

---

## Tips for writing production-ready Bash scripts

- Keep scripts simple and readable
- Quote variables properly
- Check exit codes
- Use functions for reusable logic
- Log meaningful messages
- Handle errors gracefully
- Test scripts before using them in production
- Prefer readable automation over clever one-liners

---

## Recommended next steps

After completing this repository, continue with:

- shell scripting for system administration
- advanced `awk` and `sed` usage
- `systemd` service management
- CI/CD automation with shell scripts
- Linux troubleshooting workflows
- infrastructure-as-code automation

The goal is to move from writing simple scripts to building reliable operational tooling.

---

## Repository structure

- `Lesson1-Variables` — variables, environment values, and shell basics
- `Lesson2-Conditionals` — conditionals, loops, and connectivity checks
- `Lesson3-Functions` — reusable automation patterns
- `Lesson4-LogAnalysisUsingAWK` — logs, filtering, and troubleshooting with `awk`
- `Lesson5-LogAnalysisUsingGrep` — search and pattern matching for incident triage

---

## Final chapter: Build operational confidence

Bash is not just a language for quick commands; it is a core operational skill for SRE and DevOps engineers. The real value comes from using it to automate routine checks, solve incidents faster, and make system troubleshooting repeatable.

This repository is your starting point. Practice often, build small scripts, and turn repeated human tasks into automation.

---

## Happy learning

Build scripts. Break them. Fix them. Repeat.
That is how operational confidence is built.
