class HashSet
  attr_accessor :count, :store

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    if self.include?(key)
      return false
    else
      self[key] << key
      @count += 1
    end

    resize! if @count > num_buckets
  end

  def include?(key)
    self[key].include?(key)
  end

  def remove(key)
    if self.include?(key)
      self[key].delete(key)
      self.count -= 1
    end
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    self.store[num % num_buckets]
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
