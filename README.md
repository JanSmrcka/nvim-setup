# Neovim Keymap Cheat Sheet

## Obecné klávesové zkratky (neremapované)

| Klávesová zkratka    | Akce                                            |
| -------------------- | ----------------------------------------------- |
| `:w`                 | Uložit soubor                                   |
| `:q`                 | Zavřít soubor                                   |
| `:wq`                | Uložit a zavřít soubor                          |
| `:q!`                | Zavřít soubor bez uložení                       |
| `:e [název_souboru]` | Otevřít soubor                                  |
| `:vs`                | Vertikální rozdělení obrazovky (split window)   |
| `:sp`                | Horizontální rozdělení obrazovky (split window) |
| `Ctrl+w, h/j/k/l`    | Přepínání mezi okny (vlevo/dolů/nahoru/vpravo)  |
| `u`                  | Zpět (undo)                                     |
| `Ctrl+r`             | Opakovat akci (redo)                            |
| `x`                  | Odstranit znak                                  |
| `dd`                 | Odstranit celý řádek                            |
| `yy`                 | Zkopírovat celý řádek                           |
| `p`                  | Vložit po kurzoru                               |
| `o`                  | Vytvořit nový řádek pod aktuálním               |
| `O`                  | Vytvořit nový řádek nad aktuálním               |
| `gg`                 | Jít na začátek souboru                          |
| `G`                  | Jít na konec souboru                            |
| `0`                  | Jít na začátek řádku                            |
| `$`                  | Jít na konec řádku                              |
| `Ctrl+o`             | Jít zpět na předchozí pozici kurzoru            |
| `Ctrl+i`             | Jít vpřed na další pozici kurzoru               |
| `:noh`               | Zrušit zvýraznění hledaného textu               |
| `/[text]`            | Hledat text                                     |
| `n`                  | Jít na další výskyt hledaného textu             |
| `N`                  | Jít na předchozí výskyt hledaného textu         |
| `%`                  | Skok na odpovídající závorku ((), {}, [])       |

## Obecné klávesové zkratky z tvé keymapy

| Klávesová zkratka | Akce                                  |
| ----------------- | ------------------------------------- |
| `<leader>u`       | Otevře/zavře Undotree                 |
| `<leader>pf`      | Vyhledávání souborů pomocí Telescope  |
| `<C-p>`           | Vyhledávání Git souborů               |
| `<leader>fg`      | Live grep (hledání v souborech)       |
| `<leader>fb`      | Zobrazení bufferů                     |
| `<leader>fh`      | Zobrazení nápovědy (help tags)        |
| `<leader>ps`      | Grep s vlastním vyhledávacím řetězcem |
| `<leader>a`       | Přidá soubor do Harpoon               |
| `<C-e>`           | Otevře/zavře rychlé menu Harpoon      |
| `<C-h>`           | Naviguje na první soubor v Harpoon    |
| `<C-j>`           | Naviguje na druhý soubor v Harpoon    |
| `<C-k>`           | Naviguje na třetí soubor v Harpoon    |
| `<C-l>`           | Naviguje na čtvrtý soubor v Harpoon   |
| `<leader>gs`      | Otevře Git v Neovimu                  |

## LSP (Language Server Protocol) klávesové zkratky

| Klávesová zkratka  | Akce                                      |
| ------------------ | ----------------------------------------- |
| `<leader>f`        | Formátování kódu                          |
| `gd`               | Jít na definici                           |
| `K`                | Zobrazení dokumentace                     |
| `<leader>vws`      | Vyhledání symbolů v projektu              |
| `<leader>vd`       | Zobrazení diagnostiky (chyby)             |
| `[d`               | Jít na další chybu                        |
| `]d`               | Jít na předchozí chybu                    |
| `<leader>vca`      | Zobrazení možných akcí (code actions)     |
| `<leader>vrr`      | Zobrazení odkazů na symbol r              |
| `<leader>vrn`      | Přejmenování symbolu                      |
| `<C-h>` (v insert) | Zobrazení nápovědy pro podpis (signature) |

## Teleskop (Telescope) klávesové zkratky

| Klávesová zkratka | Akce                                  |
| ----------------- | ------------------------------------- |
| `<leader>pf`      | Vyhledávání souborů pomocí Telescope  |
| `<leader>fg`      | Live grep (hledání v souborech)       |
| `<leader>fb`      | Zobrazení bufferů                     |
| `<leader>fh`      | Zobrazení nápovědy (help tags)        |
| `<leader>ps`      | Grep s vlastním vyhledávacím řetězcem |

## Harpoon klávesové zkratky

| Klávesová zkratka | Akce                                |
| ----------------- | ----------------------------------- |
| `<leader>a`       | Přidá aktuální soubor do Harpoon    |
| `<C-e>`           | Otevře/zavře rychlé menu Harpoon    |
| `<C-h>`           | Naviguje na první soubor v Harpoon  |
| `<C-j>`           | Naviguje na druhý soubor v Harpoon  |
| `<C-k>`           | Naviguje na třetí soubor v Harpoon  |
| `<C-l>`           | Naviguje na čtvrtý soubor v Harpoon |

## CMP (Completion)

| Klávesová zkratka | Akce                          |
| ----------------- | ----------------------------- |
| `<C-p>`           | Vybere předchozí položku      |
| `<C-n>`           | Vybere další položku          |
| `<CR>`            | Potvrdí výběr                 |
| `<C-e>`           | Zobrazí možnosti pro doplnění |
