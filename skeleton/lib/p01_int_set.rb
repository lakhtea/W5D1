require 'set'

class MaxIntSet
  attr_accessor :store

  def initialize(range)
    @range = (0...range)
    @set = Set.new
    @store = Array.new(range, false)
  end

  def insert(num)
    if @range.include?(num)
      @set.add(num)
      store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    @set.delete(num)
  end

  def include?(num)
    @set.include?(num)
  end

  private

  def is_valid?(num)

  end

  def validate!(num)

  end
end


class IntSet
  attr_accessor :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @set = Set.new
  end

  def insert(num)
    @set.add(num)
  end

  def remove(num)
    @set.delete(num)
  end

  def include?(num)
    @set.include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @set = Set.new {}
  end

  def insert(num)
    unless self.include?(num)
      resize! if @count == num_buckets
      @set.add(num) 
      @count += 1
    end
  end

  def remove(num)
    if self.include?(num)
      @set.delete(num)
      @count -= 1
    end
  end

  def include?(num)
    @set.include?(num)
  end

  
  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    num_buckets.times do
      @store << []
    end
  end

end
