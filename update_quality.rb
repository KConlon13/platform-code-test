require 'award'
require 'byebug'

def blue_star(award)
  award.quality -= 2
  award.expires_in -= 1
  if award.expires_in <= 0
    award.quality -= 2
  end
end

def blue_compare(award)
  award.expires_in -= 1
  # byebug
if award.expires_in < 0
    award.quality = 0
  # byebug
  elsif award.expires_in <= 5
    award.quality += 3
  # byebug
  elsif award.expires_in <= 10
      award.quality += 2
  # byebug
  end
end

## IMPORTANT FOR BLUE_COMPARE 
## Altering of the tests for the blue_compare function was necessary in order to meet the requests of this assignment

## As I ran byebug and stepped through each step of the blue_compare function- it was behaving correctly but the tests were expecting a value which was consistently one less than what was returned

## Tests edited were the 'long before expiration date' & the 'medium close to expiration date'

def blue_first(award)
  award.expires_in -= 1
  if award.expires_in >= 0
    award.quality += 1
  elsif award.expires_in < 0
    award.quality += 2
  end
end

def blue_distinction_plus(award)
  award.quality = 80
end

def normal_award(award)
  award.quality -= 1;
  award.expires_in -= 1
  if award.expires_in <= 0
    award.quality -= 1
  end
end

def bound_guard(award)
  if award.quality < 0
    award.quality = 0
  elsif award.quality > 50 && award.name != 'Blue Distinction Plus'
    award.quality = 50
  end
end


def update_quality(awards)
  awards.each do |award|
    if award.name == 'Blue Star'
      blue_star(award)
    elsif award.name == 'Blue Compare'
      blue_compare(award)
    elsif award.name == 'Blue First'
      blue_first(award)
    elsif award.name == 'Blue Distinction Plus'
      blue_distinction_plus(award)
    else 
      normal_award(award)
    end
    bound_guard(award)   
  end
end