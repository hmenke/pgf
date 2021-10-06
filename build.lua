-- Identify the bundle and module
bundle = ""
module = "pgf"

-- Non-standard structure
docfiledir    = "./doc/generic/pgf"
sourcefiledir = "./tex"
flattentds = false

-- Non-standard installation
installfiles = {"**/*.cfg", "**/*.def", "**/*.lua", "**/*.tex"}

-- Nothing to unpack
sourcefiles = installfiles
unpackfiles = { }

-- Use the generic root as-standard
tdsroot = "generic"

-- Location mapping done by hand to preserve structure
-- This is a long list so we use a separate file
tdslocations = require("./filemap.lua")

-- For the manual
docfiles =
  {
    "./images/*.jpg",
    "./images/*.pdf",
    "./text-en/*.tex",
    "./version-for-luatex/*.cfg",
    "./version-for-luatex/en/*.tex"
  }
typesetfiles = {"pgfmanual.tex"}
typesetexe = "lualatex"

-- To allow writing
function docinit_hook()
  mkdir(typesetdir .. "/plots")
  return 0
end

-- Set up to allow testing dvips, etc.
specialformats = specialformats or {}
specialformats["latex"] = specialformats["latex"] or
 {
    latexdvips = {binary = "latex", format = "latex"}
  }
checkengines = {"pdftex", "latexdvips", "luatex", "xetex"}