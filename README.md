# Merge Sort
Implementations of merge sort in **Haskell (functional)** and **Python (imperative)**.


## Differences:
### Haskell
- No variable modification
- Logic handled with pattern matching only
- Implementation only uses recursion
- Follows strong, static typing checked at compile time
- Uses generational garbage collector
  - Uses "stop-the-world" strategy, suspending all application threads to free up space
  - Frequently collects newest allocation memory, and rarely collects oldest allocated memory
  - Garbage only collected when memory is needed

### Python
- Modifies variables
- Logic handled with explicit `if/else` statements
- Implementation uses a blend of both recursion and iterative loops
- Follows strong, dynamic typing checked at runtime
- Uses reference counting + cycle-detecting generational collector
  - Requires all objects to store count that is updated every time they are assigned or deleted
  - Most objects removed when reference count is zero
  - Uses generational counter for difficult memory cleanup cases

## How to Run
Start by cloning the repository:
```bash
git clone git@github.com:spencer-t-york/CIS524-Final-Project.git
cd CIS524-Final-Project
```

### Haskell

**Prerequisites:** [GHC + Cabal](https://www.haskell.org/ghcup/)

Run:
```bash
cabal run
```

Test:
```bash
cabal test --test-show-details=always
```

> [!NOTE]
> Run `cabal update` if packages are outdated.


### Python

**Prerequisites:** Python 3 ([download here](https://www.python.org/downloads/))

Run:
```bash
python3 imperative/merge_sort.py
```
> [!NOTE] 
> No need for a virtual environment since there are no dependencies.
