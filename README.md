# Pushswap_checker 🔄

Welcome to the **pushswap_checker**.

This program is designed to check whether a sequence of operations successfully sorts a list of integers, as per the rules of a push swap game.

## Language and Tools 🛠️

![Haskell](https://img.shields.io/badge/Haskell-5D4F85?style=for-the-badge&logo=haskell&logoColor=white)

- **Language:** Haskell
- **Compilation:** Via Makefile, including `re`, `clean`, and `fclean` rules.
- **Binary Name:** pushswap_checker

## Project Overview 🔎

The aim of this project is to create a program that takes a list of signed integers and a sequence of push swap operations. It checks whether the operations sort the list and outputs the result.

### How It Works

- **Input:** A list of signed integers and a sequence of push swap operations.
- **Output:** `OK` if the list is sorted as a result of the operations, `KO` otherwise.

### Operations

- `sa`: Swap the first two elements of list `l_a`.
- `sb`: Swap the first two elements of list `l_b`.
- `sc`: Perform `sa` and `sb` simultaneously.
- `pa`: Move the first element of `l_b` to `l_a`.
- `pb`: Move the first element of `l_a` to `l_b`.
- `ra`: Rotate `l_a` towards the beginning (first element becomes last).
- `rb`: Rotate `l_b` towards the beginning (first element becomes last).
- `rr`: Perform `ra` and `rb` simultaneously.
- `rra`: Rotate `l_a` towards the end (last element becomes first).
- `rrb`: Rotate `l_b` towards the end (last element becomes first).
- `rrr`: Perform `rra` and `rrb` simultaneously.

### Invocation

```
∼> echo “sa pb pb pb sa pa pa pa” | ./pushswap_checker 2 1 3 6 5 8
OK

∼> echo “sa pb pb pb” | ./pushswap_checker 2 1 3 6 5 8
KO: ([6,5,8],[3,2,1])
```

## Installation and Usage 💾

1. Clone the repository.
2. Compile the program using the provided Makefile.
3. Run the checker: `echo [operations] | ./pushswap_checker [list of numbers]`.
4. For detailed guidelines, refer to `pushswap_checker.pdf`.

## License ⚖️

This project is released under the MIT License. See `LICENSE` for more details.