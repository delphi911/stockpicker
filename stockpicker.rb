class Stock_picker
    attr_reader :min, :max, :profit, :minday, :maxday
    def initialize
        @profit = 0
        @profitarr = [0,0]
    end
    def stock_picker(dates)
      @max = nil
      return if dates.select.count {|x| x != 0} == 0
      @min = dates.select {|x| x != 0}.min
      dates.each_with_index { |v, i| @max = v if (@max.nil? || @max <=v) && (i >= dates.find_index(@min))}
      @minday = dates.find_index(@min)
      @maxday = dates.find_index(@max)
      if (@max - @min) >= @profit
        @profit = (@max - @min)
        @profitarr = [@minday,@maxday]
      end
      dates[@minday] = 0
      stock_picker(dates)

      @profitarr
    end
end


sp = Stock_picker.new
p sp.stock_picker([17,3,6,9,15,8,6,1,10])
