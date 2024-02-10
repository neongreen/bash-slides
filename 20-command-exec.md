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

### Glob expansion: bonus question

What is the difference between `ls a*` and `echo a*`?

---

Command execution: environment variables
----------------------------------------

Command execution: redirection
----------------------------------------

Command execution: path lookup & builtins
----------------------------------------

Command execution: exit code
----------------------------------------
