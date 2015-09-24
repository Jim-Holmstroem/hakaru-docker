module Util (
    makeHistogram
) where

import Graphics.Rendering.Chart
import Graphics.Rendering.Chart.Gtk
import Graphics.Rendering.Chart.Plot.Histogram

import qualified Data.Vector as V
import Data.Default
import Control.Lens


makeHistogram :: Int -> V.Vector Double -> String -> Renderable ()
makeHistogram bins values title = toRenderable layout
    where hist = plot_hist_values  .~ (V.toList values)
                    $ plot_hist_range .~ Just (V.minimum values, V.maximum values)
                    $ plot_hist_bins  .~ bins
                    $ plot_hist_drop_lines .~ True
                    $ defaultPlotHist
          layout :: Layout Double Int
          layout = layout_title .~ title
                    $ layout_title_style . font_name .~ "MathJax_"
                    $ layout_plots .~ [ histToPlot hist ]
                    $ def


