# create best combo array (buy day and sell day indexes and the profit, will be a 3 item array, actually, make it a hash)
# default best should be 0, no buy and selling shoul be done if you can't make a profit {profit: false, buy: undefined, sell: undefined, profit: 0}
# for each day, buy in and then see the profit of selling on each day after
#   on each sell check if it is better than the current best, if it is update the current best
#   then display the best days and their profit to the terminal
#   if there is no profitable day say: DO NOT INVEST

values = [17,3,6,9,15,8,6,1,10]

def stockpicker(day_prices)
  best_investment = {
    invest: false,
    buy_index: 0, 
    sell_index: 0, 
    profit: 0
  }

  day_prices.each_with_index do |buy_value, buy_day|
    day_prices.each_with_index do |sell_value, sell_day|
      if buy_day < sell_day
        new_profit = sell_value - buy_value
        if new_profit > best_investment[:profit]
          best_investment[:invest] = true
          best_investment[:buy_index] = buy_day
          best_investment[:sell_index] = sell_day
          best_investment[:profit] = new_profit
        end
      end
    end
  end

  if best_investment[:invest] == true
    puts "Profit is possible:\n\nBuy on day #{best_investment[:buy_index]} and sell on day #{best_investment[:sell_index]}, you will make #{best_investment[:profit]} unit of currency.\n\n\n\n"
  else
    puts "No profitable investment possible:\n\nDO NOT INVEST\n\n\n\n"
  end
  
end

stockpicker(values)

        

