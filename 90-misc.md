
Misc
=======================================

Misc TODOs:
* Mention `&` in command-exec?

---

Is a variable set?
---------------------------------------

We're unlucky and Bash 4.1 still exists at RHEL6, so we can't use `-v`.

```bash
empty=
space=" "
full="STRING"

echo missing... "${missing+x}"
echo empty..... "${empty+x}"
echo space..... "${space+x}"
echo full...... "${full+x}"
```

---

Is a variable set? (2)
---------------------------------------

```bash
b=
c=" "
d="STRING"

[[ -n "${a+x}" ]] && echo "a is set"
[[ -n "${b+x}" ]] && echo "b is set"
[[ -n "${c+x}" ]] && echo "c is set"
[[ -n "${d+x}" ]] && echo "d is set"
```
