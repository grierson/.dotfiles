return {
  "echasnovski/mini.nvim",
  lazy = false,
  keys = {
    {
      "<cr>",
      function()
        local mini_jump2d = require('mini.jump2d')
        mini_jump2d.start(mini_jump2d.builtin_opts.single_character)
      end,
      { "n", "v" },
      desc = "Jump 2d",
    },
  },
  config = function()
    require('mini.basics').setup()     -- Better defaults
    require('mini.trailspace').setup() -- Trailing space
    require('mini.comment').setup()    -- Comments - gcc
    require('mini.pairs').setup()      -- Auto close
    require('mini.surround').setup()   -- add/change/delete surround
    require('mini.cursorword').setup() -- Highlight current cursorword
    require('mini.jump2d').setup(
      {
        mappings = {
          start_jumping = '',
        },
      }
    )                                 -- Quick jump anywhere - <CR> <follow letters>
    require('mini.bracketed').setup() -- Bracket movement
    require('mini.splitjoin').setup() -- gS split or join args
    require('mini.starter').setup()   -- Starter screen
    require('mini.sessions').setup()  -- Sessions
    require('mini.notify').setup()    -- Progress bar
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })

    -- Move code
    require('mini.move').setup({
      mappings = {
        up = '<S-up>',
        down = '<S-down>'
      }
    })

    -- Status line
    require('mini.statusline').setup({
      set_vim_settings = false
    })

    local miniclue = require('mini.clue')
    miniclue.setup({
      triggers = {
        -- Leader triggers
        { mode = 'n', keys = '<Leader>' },
        { mode = 'x', keys = '<Leader>' },
        { mode = 'n', keys = '<LocalLeader>' },

        -- Built-in completion
        { mode = 'i', keys = '<C-x>' },

        -- `g` key
        { mode = 'n', keys = 'g' },
        { mode = 'x', keys = 'g' },

        -- Marks
        { mode = 'n', keys = "'" },
        { mode = 'n', keys = '`' },
        { mode = 'x', keys = "'" },
        { mode = 'x', keys = '`' },

        -- Registers
        { mode = 'n', keys = '"' },
        { mode = 'x', keys = '"' },
        { mode = 'i', keys = '<C-r>' },
        { mode = 'c', keys = '<C-r>' },

        -- Window commands
        { mode = 'n', keys = '<C-w>' },

        -- `z` key
        { mode = 'n', keys = 'z' },
        { mode = 'x', keys = 'z' },

        -- `Bracketed` key
        { mode = 'n', keys = '[' },
        { mode = 'n', keys = ']' },
        { mode = 'x', keys = '[' },
        { mode = 'x', keys = ']' },
      },

      clues = {
        { mode = 'n', keys = '<Leader>w', desc = '+Workspace' },
        { mode = 'n', keys = '<Leader>s', desc = '+Search' },
        { mode = 'n', keys = '<Leader>l', desc = '+LSP' },
        { mode = 'n', keys = '<Leader>h', desc = '+Hunk' },
        -- Enhance this by adding descriptions for <Leader> mapping groups
        miniclue.gen_clues.builtin_completion(),
        miniclue.gen_clues.g(),
        miniclue.gen_clues.marks(),
        miniclue.gen_clues.registers(),
        miniclue.gen_clues.windows(),
        miniclue.gen_clues.z(),
      },
    })
  end
}
