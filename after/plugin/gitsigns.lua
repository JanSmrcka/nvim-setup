require('gitsigns').setup({
  signs = {
    add          = { text = '│' },
    change       = { text = '│' },
    delete       = { text = '_' },
    topdelete    = { text = '‾' },
    changedelete = { text = '~' },
    untracked    = { text = '┆' },
  },
  -- Zapne inline blame (zobrazí informace o commitu na konci řádku)
  current_line_blame = false,   -- Vypnuté defaultně, zapnete když potřebujete
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol',     -- 'eol' | 'overlay' | 'right_align'
    delay = 1000,
    ignore_whitespace = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  -- Klávesové zkratky
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigace mezi změnami
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, { expr = true })

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, { expr = true })

   -- Akce
    map('n', '<leader>gb', gs.toggle_current_line_blame)                -- Toggle git blame
    map('n', '<leader>gB', function() gs.blame_line { full = true } end) -- Detailní blame
    map('n', '<leader>gh', gs.preview_hunk)                             -- Náhled změn
    map('n', '<leader>gr', gs.reset_hunk)                               -- Reset změn v hunku
    map('n', '<leader>gR', gs.reset_buffer)                             -- Reset celého bufferu
    map('n', '<leader>gu', gs.undo_stage_hunk)                          -- Unstage hunk
    map('n', '<leader>gd', gs.diffthis)                                 -- Diff
  end
})

