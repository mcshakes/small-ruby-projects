
def change_it(arr)
  normalize(arr)
  date_dealer(arr)
  numberize_months(arr)


end

DATE = {
  "April": 04,
  "May": 05,
  "June": 06
}

def normalize(array)
  arr = []
  array.each do |date|
    unless date.include? "-"
      date.gsub!(/\/|\s|,/, "-")
      arr << date
    else
      arr << date
    end
  end
  return arr
end

def date_dealer(arr)
  final = []
  arr.each do |date|
    date = date.split("-")
    if date[1].length == 1
      date[1] = "0" + date[1]
    end

    if date[2].length == 2
      date[2] = "20" + date[2]
    end

    final << date
  end

  final.map do |date|
    date.join("-")
  end
end

def numberize_months(arr)
  final = []
  arr.each do |date|
    date = date.split("-")
    months = DATE.keys.each {|month| month.to_s}
    similarity = date & months
    final << similarity
  end

  string_month = final.flatten[0]

  DATE[string_month]
end

arr = ["12-10-2004", "May 9,1989", "12/4/10"]
p change_it(arr)
  
