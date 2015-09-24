import qualified Data.Vector as V

import Language.Hakaru.Distribution
import Language.Hakaru.Metropolis

import Util


main = do
    let mu = 5
    let sd = 1
    let test = unconditioned (normal mu sd)

    samples <- mcmc test []
    let l = V.fromList (take 1000 samples)
    return $ makeHistogram 30 l ("Normal(" ++ show mu ++ ","
                                           ++ show sd ++ ")")
