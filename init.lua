-- Načtení základní konfigurace
require("jendis.remap")  -- Explicitně načteme remap
require("jendis.set")    -- Pokud máte další základní nastavení
require("jendis")        -- Načte init.lua z lua/jendis/init.lua

-- Pro jistotu přidáme opts definici do globálního scopu
vim.g.mapleader = " "
vim.g.maplocalleader = " "
