require 'byebug'

class Integer
  # Integer#hash already implemented for you
end

class Array


  def hash

    new_hash = {}
    if new_hash.has_key?(self)
      new_hash[self].hash
    else
      new_hash[self] = self.object_id.to_i
    end
          
  end
end

class String

  def hash
    
    new_hash = {}
    if new_hash.has_key?(self)
      new_hash[self] = self.object_id.hash
    else
      self.object_id.hash
    end


  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end


a = Array.new([1,2,3])
b = Array.new([1,2])
c = Array.new([1,2,3])

p a.hash
p b.hash
p c.hash