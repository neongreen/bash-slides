Command execution
=======================================

I type:

```bash
ls -l /
```

What happens next?

---

Command execution: PATH
---------------------------------------

Have to find the binary first.

```bash
echo $PATH    # Colon-separated dirs to look for binaries
```

```bash
which ls      # Show us the path
```

---

Command execution: arguments
---------------------------------------

```c
// ls.c
int main(int argc, char *argv[]) { ... }
```

<!-- Arguments are passed by the kernel (execve syscall) -->

---

Command execution: variable expansion
---------------------------------------

QUESTION: What arguments did `echo` receive?

```bash
name=Emily

echo "Hello, $name!"
```

---

Command execution: tilde expansion
---------------------------------------

QUESTION: What arguments did `echo` receive?

```bash
echo ~
```

---

Command execution: glob expansion
---------------------------------------

QUESTION: What arguments did `ls` receive?

```bash
cd /tmp; touch a.txt b.txt c.mama

ls *.txt
```

---

### Quotes vs. no quotes

QUESTION: What will happen?

```bash
cd /tmp; touch a.txt b.txt c.mama

ls "*.txt"    # instead of ls *.txt
```

---

### All directories matching a glob

QUESTION: How to list all directories matching a glob?

```bash
cd /tmp; mkdir -p Xdir Ydir Zdir

ls *dir    # What will it do?
```

<!-- Answer: echo *dir or ls -d *dir -->

---

Command execution: environment variables
----------------------------------------

Environment is a list of key-value pairs passed to each process.

```bash
env | head -5    # Let's see some env vars
```

<!-- https://decasia.org/tech/2023/03/where-do-env-vars-come-from.html -->

---

### Passing env vars

Bash:

```bash
LOGLEVEL=debug ./myapp
```

Syscall:

```c
int execve(const char *pathname,
           char *const _Nullable argv[],
           char *const _Nullable envp[]);
```

---

### Exporting vars

```bash
LOGLEVEl=debug           # Will *not* be passed to child processes
export LOGLEVEL=debug    # Will be passed to child processes
```

---

### Modifying env vars inside the process

| | Can you modify env vars? |
|-|-|
| Yours | Yes |
| Parent's | No |

*Fig. 1: The Table of Possibility of Modification of Vars of Env*

---

### Env var inheritance

User-space convention.

`libc` and everyone else will pass env vars to child processes.
Kernel doesn't care if you do it or not.

---

Command execution: working directory
----------------------------------------

Each process has a working directory.

Stored in the process descriptor (`task_struct` -> `fs_struct`) in Linux.

```bash
(cd /; ls -l | head -5)
```

---

Command execution: redirection
----------------------------------------

```bash
echo "Hello, world!" > /tmp/hello.txt
```

QUESTIONS:

1. Who is responsible for creating the file?
2. Who is responsible for writing to the file?
3. Who is responsible for closing the file?

---

### The three standard descriptors

| Handle | Name | Virtual file | Co to jest? |
|-|-|-|-|
| 0 | stdin | `/dev/stdin` | Input |
| 1 | stdout | `/dev/stdout` | Output |
| 2 | stderr | `/dev/stderr` | Error output |

---

### When is stderr used?

Everything that is not the "result".

| Thing | How it is conveyed |
|-|-|
| String result | stdout |
| Success/failure | exit code |
| Random enums | exit code |
| Complaints | stderr |

---

### Redirection syntax

| Syntax | Meaning |
|-|-|
| `cmd > file` | stdout -> file |
| `cmd 2> file` | stderr -> file |
| `cmd &> file` | both -> file |
| `cmd < file` | file -> stdin |
| `cmd 2>&1` | stderr -> stdout |

Special "file": `/dev/null`.

---

Command execution: exit code
----------------------------------------

```bash
cd /tmp; echo hello > file.txt

grep -q hello file.txt; echo hello=$?
grep -q world file.txt; echo world=$?
```

---

Command execution: builtins
----------------------------------------

Builtins are commands that the shell executes by itself.

Examples:

* `ls` is a binary.
* `echo` is a builtin, but can be a binary (`/bin/echo`).
* `time` is a reserved word, but can be a binary (`/usr/bin/time`).

QUESTION:

* `cd` can't be a binary. Has to be a builtin. Why?
