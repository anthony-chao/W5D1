class MaxIntSet
  attr_accessor :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if is_valid?(num)
      @store[num] = true
    else
      raise 'Out of bounds'
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num] == true
  end

  private

  def is_valid?(num)
    num.between?(0, @store.length)
  end

  def validate!(num)
    raise 'number is out of range' if !is_valid?(num)
  end

end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[(num % num_buckets)] << num
    true
  end

  def remove(num)
    self[(num % num_buckets)].delete(num)
  end

  def include?(num)
    self[(num % num_buckets)].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_accessor :count, :store

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    if self.include?(num)
      return false
    else
      self[num] << num
      self.count += 1
    end

    resize! if self.count > num_buckets
  end

  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      self.count -= 1
    end

  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!

    old_store = self.store
    @count = 0
    @store = Array.new(num_buckets * 2) { Array.new }
    
    old_store.flatten.each { |ele| insert(ele) }

  end

end
