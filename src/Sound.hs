module Sound (Sound(..)) where

-- | The known 'Sound's.
data Sound
  = Brr
  | Birip
  | Brrah
  | Croac
  | Fiu
  | Plop
  | Pep
  | CricCric
  | TrriTrri
  | BriBri
  deriving (Eq, Enum)

instance Show Sound where
  show Brr      = "brr"
  show Birip    = "birip"
  show Brrah    = "brrah"
  show Croac    = "croac"
  show Fiu      = "fiu"
  show Plop     = "plop"
  show Pep      = "pep"
  show CricCric = "cric-cric"
  show TrriTrri = "trri-trri"
  show BriBri   = "bri-bri"
