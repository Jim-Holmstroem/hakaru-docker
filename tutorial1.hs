import qualified Language.Hakaru.ImportanceSampler as IS
import Language.Hakaru.Distribution

import Control.Lens
import Data.Default
import qualified Data.Vector as V

import Data.Dynamic
import qualified Data.Map.Strict as M

import Util

values = V.fromList [ 1, 1, 2, 3, 8, 8, 8, 8,10] :: V.Vector Double


main = do
    let test  = IS.unconditioned (normal (-3) 1)
    let test2 = IS.unconditioned (uniform 1 5)
    t  <- IS.sample test []
    let s  = take 1000 $ map fst t
    t2 <- IS.sample test2 []
    let s2 = take 1000 $ map fst t2
    return (makeHistogram 30 (V.fromList (s ++ s2)) "Histogram")
