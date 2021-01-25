require 'set'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
    @set = Set.new
  end

  def insert(key)
    resize! if @count == num_buckets
    @set.add(key)
    @count += 1
  end

  def include?(key)
    @set.include?(key)   
  end

  def remove(key)
    if include?(key)
      @set.delete(key)
      @count -= 1
    end
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
