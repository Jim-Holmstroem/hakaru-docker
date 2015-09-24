import qualified Data.Vector as V

import Statistics.Sample

import Language.Hakaru.Distribution
import Language.Hakaru.Metropolis


main = do
    let mu = 5
    let sd = 1
    let test = unconditioned (normal mu sd)

    samples <- mcmc test []
    let l = V.fromList (take 1000 samples)
    print $ "expectation of normal("++ show mu ++
            "," ++ show sd ++ "): " ++ show (mean l)
