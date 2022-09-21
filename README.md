# The Musical Lake

An implementation of The Musical Lake using Haskell. It could be simpler but I have overcomplicated it in order to show some advanced usages such as monads, monad transformers, parser combinators and existential types.

Also, although Haskell is not OOP, I have coded the solution in an OOP way in order to show good OOP code as requested.

```sh 
stack build

stack exec musical-lake-exec
Type the last sound you heard:
birip
🦗: trri-trri
🐸: croac

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
