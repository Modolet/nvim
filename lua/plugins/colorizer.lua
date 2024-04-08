local ft = { "html", "css", "scss", "vue", "slint", "toml", "json" }
return {
  {
    "norcalli/nvim-colorizer.lua",
    ft = ft,
    config = function()
      require("colorizer").setup(ft, {
        RGB = true,
        RRGGBB = true,
        names = true,
        RRGGBBAA = true,
        rgb_fn = true,
        hsl_fn = true,
        css = true,
        css_fn = true,
        mode = "background",
      })
    end,
  },
}
