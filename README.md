# The Musical Lake

An implementation of The Musical Lake using Haskell. It could be simpler but I have overcomplicated it in order to show some advanced usages such as monads, monad transformers, parser combinators and existential types.

Also, although Haskell is not an object-oriented language, I have coded the solution in a slightly OOP way in order to show good OOP practices as requested:

* Animals implement an interface that shows the behavior of reacting to a sound that happens in the environment.
* The Musical Lake could be seen as a class that represents the environment, allows Animals to register and then plays the song by checking which one handles which sound.

## Requirements
* [stack](https://www.haskellstack.org) (tested with version 2.7.5)

## Usage

```sh 
# Build the project
stack build

# Execute a main program that reads a known sound 
# and continues with the song
stack exec musical-lake-exec
Type the last sound you heard:
birip
🦗: trri-trri
🐸: croac

# Test the known songs
stack test
Song with sounds [brr,fiu,cric-cric,brrah]
  Continue from brr
  Continue from fiu
  Continue from cric-cric
  Continue from brrah
Song with sounds [pep,birip,trri-trri,croac]
  Continue from pep
  Continue from birip
  Continue from trri-trri
  Continue from croac
Song with sounds [bri-bri,plop,cric-cric,brrah]
  Continue from bri-bri
  Continue from plop
  Continue from cric-cric
  Continue from brrah

Finished in 0.0019 seconds
12 examples, 0 failures
```
