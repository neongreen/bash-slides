Command execution
=======================================

I type:

```bash
ls -l /
```

What happens next?

---

Command execution: arguments
---------------------------------------

```c
// ls.c
int main(int argc, char *argv[]) { ... }
```

<!--
Arguments are passed by the kernel (execve syscall). Also see:
https://decasia.org/tech/2023/03/where-do-env-vars-come-from.html
-->

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

### Quotes vs no quotes

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

Command execution: redirection
----------------------------------------

Command execution: path lookup & builtins
----------------------------------------

Command execution: exit code
----------------------------------------
