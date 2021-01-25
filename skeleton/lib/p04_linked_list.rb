class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end

class LinkedList
  include Enumerable
  def initialize
    @head = Node.new
    @tail = @head
    @head.next = @tail
    @tail.prev = @head
    @count = 0
  end

  def [](i)
    self.each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head
  end

  def last
    @tail
  end

  def empty?
    @head.key.nil?
  end

  def get(key)
    self.each_with_index { |link, i| return link.val if link.key == key }
    nil
  end

  def include?(key)

  end

  def append(key, val)      # a(head) -> b -> new_node(tail)
    if @head.key.nil?
      new_node = Node.new(key, val)
      @head = new_node
      @tail = new_node
      @count += 1
    else
      new_node = Node.new(key, val)
      @tail.next = new_node
      new_node.prev = @tail
      @tail = new_node
      @count +=1 
    end
  end

  def update(key, val)
  end

  def remove(key)
  end

  def each
    arr = []
    current_node = @head
    while arr.length < 3
      arr << current_node.val
      current_node = current_node.next
    end
    arr
  end

  # uncomment when you have `each` working and `Enumerable` included
  # def to_s
  #   inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  # end
end
