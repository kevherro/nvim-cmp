local binary = require 'cmp.utils.binary'

describe('utils.binary', function()
  it('insort', function()
    local func = function(a, b)
      return a.score - b.score
    end
    local list = {}
    binary.insort(list, { id = 'a', score = 1 }, func)
    binary.insort(list, { id = 'b', score = 5 }, func)
    binary.insort(list, { id = 'c', score = 2.5 }, func)
    binary.insort(list, { id = 'd', score = 2 }, func)
    binary.insort(list, { id = 'e', score = 8 }, func)
    binary.insort(list, { id = 'g', score = 8 }, func)
    binary.insort(list, { id = 'h', score = 7 }, func)
    binary.insort(list, { id = 'i', score = 6 }, func)
    binary.insort(list, { id = 'j', score = 4 }, func)
    assert.are.equal(list[1].id, 'a')
    assert.are.equal(list[2].id, 'd')
    assert.are.equal(list[3].id, 'c')
    assert.are.equal(list[4].id, 'j')
    assert.are.equal(list[5].id, 'b')
    assert.are.equal(list[6].id, 'i')
    assert.are.equal(list[7].id, 'h')
    assert.are.equal(list[8].id, 'e')
    assert.are.equal(list[9].id, 'g')
  end)
end)
