class Player

  attr_reader :pos
  attr_reader :name
  attr_reader :symbol

  def initialize(name, symbol)
    @name = name
    @symbol = symbol
    @pos = []
    @win_conditions = [[1, 2, 3],
                     [4, 5, 6],
                     [7, 8, 9],
                     [1, 4, 7],
                     [2, 5, 8],
                     [3, 6, 9],
                     [1, 5, 9],
                     [3, 5, 7]]
  end

  def add_pos(pos)
    @pos << pos
    @pos
  end

  def check_winner
    @win_conditions.each do |arr|
      cont = 0
      arr.each do |item|
        cont += 1 if @pos.include?(item.to_s)
      end
      return true if cont == 3
    end
    false
  end
end
