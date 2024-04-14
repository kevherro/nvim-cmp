local spec = require 'cmp.utils.spec'
local keymap = require 'cmp.utils.keymap'
local feedkeys = require 'cmp.utils.feedkeys'
local api = require 'cmp.utils.api'

describe('api', function()
  before_each(spec.before)
  describe('get_cursor', function()
    it('insert-mode', function()
      local cursor
      feedkeys.call(keymap.t 'i\t1234567890', 'nx', function()
        cursor = api.get_cursor()
      end)
      assert.are.equal(cursor[2], 11)
    end)
    it('cmdline-mode', function()
      local cursor
      keymap.set_map(0, 'c', '<Plug>(cmp-spec-spy)', function()
        cursor = api.get_cursor()
      end, { expr = true, noremap = true })
      feedkeys.call(keymap.t ':\t1234567890', 'n')
      feedkeys.call(keymap.t '<Plug>(cmp-spec-spy)', 'x')
      assert.are.equal(cursor[2], 11)
    end)
  end)

  describe('get_screen_cursor', function()
    it('insert-mode', function()
      local screen_cursor
      feedkeys.call(keymap.t 'iあいうえお', 'nx', function()
        screen_cursor = api.get_screen_cursor()
      end)
      assert.are.equal(10, screen_cursor[2])
    end)
    it('cmdline-mode', function()
      local screen_cursor
      keymap.set_map(0, 'c', '<Plug>(cmp-spec-spy)', function()
        screen_cursor = api.get_screen_cursor()
      end, { expr = true, noremap = true })
      feedkeys.call(keymap.t ':あいうえお', 'n')
      feedkeys.call(keymap.t '<Plug>(cmp-spec-spy)', 'x')
      assert.are.equal(10, screen_cursor[2])
    end)
  end)

  describe('get_cursor_before_line', function()
    it('insert-mode', function()
      local cursor_before_line
      feedkeys.call(keymap.t 'i\t1234567890<Left><Left>', 'nx', function()
        cursor_before_line = api.get_cursor_before_line()
      end)
      assert.are.same(cursor_before_line, '\t12345678')
    end)
    it('cmdline-mode', function()
      local cursor_before_line
      keymap.set_map(0, 'c', '<Plug>(cmp-spec-spy)', function()
        cursor_before_line = api.get_cursor_before_line()
      end, { expr = true, noremap = true })
      feedkeys.call(keymap.t ':\t1234567890<Left><Left>', 'n')
      feedkeys.call(keymap.t '<Plug>(cmp-spec-spy)', 'x')
      assert.are.same(cursor_before_line, '\t12345678')
    end)
  end)
end)
