# AGENTS.md

Agent guidelines for working with this LazyVim-based Neovim configuration.

## Build/Lint/Test Commands

### No Traditional Build System
This is a pure Lua Neovim configuration with no build, test, or package management beyond plugin management.

### Plugin Management
```bash
# Update plugins
nvim --headless "+Lazy! sync" +qa

# Check plugin status
nvim --headless "+Lazy! check" +qa

# View lazy.nvim state
nvim -c "Lazy"
```

### Code Formatting
```bash
# Format all Lua files with stylua
stylua lua/ init.lua

# Format specific file
stylua lua/plugins/telescope.lua

# Check formatting without writing
stylua --check lua/
```

### Linting
No automated linting configured. LSP diagnostics are used via `lua_ls` for Lua files.

## Code Style Guidelines

### Formatting Rules (stylua.toml)
- **Indentation:** 4 spaces (for Lua config files)
- **Column width:** 80 characters max
- **Indent type:** Spaces only, no tabs

### Neovim Options Style (lua/config/options.lua)
- **Editor indentation:** 2 spaces (tabstop=2, shiftwidth=2, softtabstop=2)
- **Line length:** Keep under 80 characters when possible
- Use `vim.opt` for options, `vim.g` for globals, `vim.o` for output options

### Import Conventions
```lua
-- External dependencies first (with blank line after)
local transform_mod = require("telescope.actions.mt").transform_mod

-- Plugin-specific requires
local actions = transform_mod({ ... })

-- Standard library last (if needed)
local vim = vim
```

### Plugin File Structure
Each plugin file in `lua/plugins/*.lua` must return a table or array of tables:

```lua
-- Single plugin
return {
    "author/plugin-name",
    dependencies = { ... },
    opts = { ... },
    config = function() ... end,
    keys = { ... },
}

-- Multiple plugins
return {
    { "plugin-one", opts = {} },
    { "plugin-two", config = function() end },
}
```

### Key Mapping Guidelines
- Always include `desc` field for which-key integration
- Use `vim.keymap.set()` over `vim.api.nvim_set_keymap()`
- Group related keymaps together with comments
- Prefer function callbacks over command strings for complex logic
- Use tables for options: `{ noremap = true, silent = true, desc = "..." }`

```lua
-- Good: Descriptive and uses function
vim.keymap.set("n", "<leader>a", function()
    harpoon:list():add()
end, { desc = "Harpoon add file" })

-- Good: Simple command with description
vim.keymap.set("n", "<C-s>", ":w<CR>", { noremap = true, silent = true, desc = "Save file" })
```

### Naming Conventions
- **Variables:** snake_case (`local file_path`, `local harpoon_list`)
- **Functions:** snake_case (`local function setup_keymaps()`)
- **Tables/Options:** snake_case (`opts`, `custom_actions`)
- **Constants:** UPPER_SNAKE_CASE (rare, used for paths)

### Comments
- Use `--` for single-line comments
- Add section headers with `-- Section Name` (capitalize first word)
- Comment complex logic, not obvious code
- Keep comments concise and actionable
- File headers describe purpose: `-- Telescope configuration with custom keymaps`

### Error Handling
```lua
-- Use pcall for operations that may fail
local ok = pcall(require("telescope.builtin").git_files, { show_untracked = true })
if not ok then
    require("telescope.builtin").find_files()
end

-- Check module existence before requiring
local has_module, module = pcall(require, "module-name")
if not has_module then
    return
end

-- Validate before accessing
if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
        { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
        { out, "WarningMsg" },
    }, true, {})
    os.exit(1)
end
```

### Plugin Configuration Patterns

#### Use `opts` for Simple Configuration
Merges with plugin defaults automatically:
```lua
return {
    "plugin/name",
    opts = {
        setting = true,
        nested = { value = 42 },
    },
}
```

#### Use `config` for Complex Setup
When you need the plugin API:
```lua
return {
    "plugin/name",
    config = function()
        local plugin = require("plugin")
        plugin:setup({ ... })
        -- Additional setup logic
    end,
}
```

#### Lazy Loading
Prefer lazy loading with triggers:
```lua
return {
    "plugin/name",
    keys = { "<leader>x" },        -- Load on keypress
    cmd = { "PluginCommand" },      -- Load on command
    event = { "BufReadPost" },      -- Load on event
    ft = { "lua" },                 -- Load on filetype
}
```

### File Organization
```
lua/
  config/
    lazy.lua       # Plugin bootstrap only
    options.lua    # Editor options only
    keymaps.lua    # Global keymaps only
    autocmds.lua   # Autocommands only
  plugins/
    *.lua          # One concern per file (telescope, harpoon, etc.)
```

### Best Practices
1. **Separation of concerns:** Keep options, keymaps, and plugin configs separate
2. **No side effects:** Plugin files should only return tables, not execute code
3. **Keymaps in plugins:** Define plugin-specific keymaps in the plugin file via `keys` or `config`
4. **Minimal autocmds:** Prefer plugin features over custom autocommands
5. **Transparent by default:** Set `transparent = true` for colorschemes
6. **LSP configuration:** Use `opts.servers` table in `lua/plugins/lsp.lua`
7. **Comments in English:** Prefer English for comments (some Czech exists but avoid adding more)

### Anti-Patterns to Avoid
- ❌ Don't use `vim.cmd()` when Lua API exists
- ❌ Don't define keymaps with `:map` commands
- ❌ Don't require modules at file top-level (use lazy requires in functions)
- ❌ Don't create files with multiple unrelated concerns
- ❌ Don't use `vim.api.nvim_set_keymap()` (use `vim.keymap.set()`)
- ❌ Don't hardcode paths (use `vim.fn.stdpath()` or `os.getenv("HOME")`)

## Common Patterns

### Conditional Plugin Loading
```lua
-- Load git_files, fallback to find_files
local ok = pcall(require("telescope.builtin").git_files, { show_untracked = true })
if not ok then
    require("telescope.builtin").find_files()
end
```

### Transform Actions (Telescope)
```lua
local transform_mod = require("telescope.actions.mt").transform_mod
local actions = transform_mod({
    custom_action = function(prompt_bufnr)
        -- Implementation
    end,
})
```

### Harpoon-style Setup
```lua
config = function()
    local harpoon = require("harpoon")
    harpoon:setup({ settings = { ... } })
    -- Define keymaps here
end
```

## Testing Changes
Since there's no test suite, validate changes by:
1. Restart Neovim: `nvim` (check for errors)
2. Run `:checkhealth` to verify plugin health
3. Run `:Lazy check` for plugin issues
4. Test affected keymaps manually
5. Check formatting: `stylua --check lua/`

## File Paths Reference
Use these when referencing code locations:
- Core config: `lua/config/{lazy,options,keymaps,autocmds}.lua`
- Plugins: `lua/plugins/*.lua`
- Entry point: `init.lua`
- Format config: `stylua.toml`
- LSP config: `.neoconf.json`
