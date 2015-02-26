


def caesar_cipher (string, shift)
	alphabet = "abcdefghijklmnopqrstuvwxyz"
	shifted = ""
	for i in 0...string.length
		is_upper = string[i].downcase!
		alpha_index = alphabet.index(string[i].downcase)
		#if character is a letter, change it
		if alpha_index
			#start over from the beginning of the alphabet if necessary
			alpha_index -= alpha_index+shift >= alphabet.length ? alphabet.length : 0
			#add the shifted letter to the new string
			shifted[i] = alphabet[alpha_index+shift]
			#keep the original case
			if is_upper
				shifted[i] = shifted[i].upcase
			end
		else
			shifted[i] = string[i]
		end
	end
	shifted
end


def stock_picker(prices)
	buy, sell = 0
	potential_profit = 0
=begin with top, bottom initialized to prices[0]
	for i in 1...prices.length
		if prices[i] > top
			top = prices[i]
			sell = i
			potential_profit = top - bottom
		elsif prices[i] < bottom
			for j in i...prices.length
				if prices[j]-prices[i] > potential_profit
					top = prices[j]
					sell = j
					bottom = prices[i]
					buy = i
					potential_profit = top-bottom
				end
			end
		end
=end

	for i in 1...prices.length
		if prices[i] > prices[sell]
			sell = i
			potential_profit = prices[sell]-prices[buy]
		elsif prices[i] < prices[buy]
			for j in i...prices.length
				if prices[j]-prices[i] > potential_profit
					buy = i
					sell = j
					potential_profit = prices[sell]-prices[buy]
				end
			end
		end





	end
	return [buy, sell]
end


def substrings (words, dictionary)
	found = Hash.new(0)
	words.downcase.split.each do |word|
		dictionary.each do |entry|
			if word.include? entry
				found[entry] += 1
			end
		end
	end 
	found
end








p caesar_cipher("What a string!", 5)


p stock_picker([17,3,6,9,15,8,6,1,10]).inspect


dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)



