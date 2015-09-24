import qualified Language.Hakaru.ImportanceSampler as IS
import Language.Hakaru.Distribution


main = do
    let test = IS.unconditioned (normal 0 1)

    samples <- IS.empiricalMeasure 16 test []
    print samples
