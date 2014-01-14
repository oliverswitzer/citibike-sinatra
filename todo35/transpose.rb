# Reimplement your own version of Ruby Array's transpose method

class Array
  def my_transpose
    transposed = []
    rows = self.size
    columns = self[0].size


    columns.times do |i|
      transposed << [] 
      self.each do |row|
        transposed[i] << row[i]
      end
    end

    puts transposed.inspect
  end
end

[[ 1,  2,  3], [:a, :b, :c]].my_transpose #=> [[1, :a], [2, :b], [3, :c]]
[[1,2], [3,4], [5,6]].my_transpose #=> [[1, 3, 5], [2, 4, 6]]
# [].transpose #=> []