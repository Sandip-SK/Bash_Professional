# Bash for SRE and DevOps Engineers

A practical learning roadmap for mastering Bash in real-world operations, automation, troubleshooting, and infrastructure work.

This repository is designed like a book: each lesson builds the foundation needed to write reliable shell scripts for system administration, monitoring, deployment support, and incident response.

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

### Chapter 1: Bash Foundations
Location: `Lesson1-Variables`

Focus:
- shell basics
- variables
- environment variables
- command substitution
- script execution patterns

This chapter teaches the language building blocks you need before handling production automation.

Key ideas:
- variable assignment and scope
- using environment values in scripts
- capturing command output and reusing it
- writing clean, readable shell scripts

---

### Chapter 2: Conditionals and Loops
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

### Chapter 3: Functions and Reusable Automation
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

---

### Chapter 4: Log Analysis and Troubleshooting
Location: `Lesson4-LogAnalysis`

Focus:
- analyzing logs with `grep`, `awk`, and filtering
- identifying error patterns
- working with large operational data sets
- extracting meaningful information from logs

This is a core SRE skill. Most incidents begin with logs. You need to quickly answer:
- What failed?
- When did it fail?
- Which service or host is impacted?
- How many errors appeared?

This chapter introduces practical log investigation workflows used in production support.

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

## Bash for daily SRE and DevOps work

Bash is used for many operational tasks, including:

- checking whether servers are reachable
- verifying service status
- restarting failed services
- parsing incident logs
- collecting system health data
- creating deployment sanity checks
- handling backup and cleanup tasks
- integrating with monitoring and automation jobs

A practical Bash script is often the fastest way to automate repetitive operational work.

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

## Common SRE Bash commands

```bash
ssh user@server
systemctl status nginx
journalctl -u nginx -n 50
grep -i error /var/log/syslog
df -h
free -m
ps aux | grep nginx
netstat -tuln
ping -c 1 google.com
curl -I http://localhost
```

These are the kinds of commands that often appear in operational workflows, and Bash helps you automate them.

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

## Final thought

Bash is not just a language for quick commands; it is a core operational skill for SRE and DevOps engineers. The real value comes from using it to automate routine checks, solve incidents faster, and make system troubleshooting repeatable.

This repository is your starting point. Practice often, build small scripts, and turn repeated human tasks into automation.

---

## Repository structure

- `Lesson1-Variables` — variables, environment values, and shell basics
- `Lesson2-Conditionals` — conditionals, loops, and connectivity checks
- `Lesson3-Functions` — reusable automation patterns
- `Lesson4-LogAnalysis` — logs, filtering, and troubleshooting with `awk`/text tools

---

## Happy learning

Build scripts. Break them. Fix them. Repeat.
That is how operational confidence is built.
