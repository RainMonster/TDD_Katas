class StringCalculator

  def add(string_numbers)
    unless string_numbers.class != String
      negatives = string_numbers.scan(/-./)
      if negatives.length > 0
        return_negatives(negatives)
      elsif string_numbers == ""
        0
      elsif string_numbers.length == 1
        string_numbers.to_i
      elsif m = /\/\//.match(string_numbers)
        to_sum = []
        split_array = m.post_match.split("\n")
        split_array[1].scan(/([#{split_array[0]}]*)(\d)/) { |x| to_sum << x[1] } # problem with this is it will allow through bad examples
        sum_the_string(to_sum)
      else 
        string_numbers.tr!(",", "\n")
        split_string = string_numbers.split("\n")
        sum_the_string(split_string)
      end
    else
      raise "Must be a string"
    end
  end

  def sum_the_string(split_string)
    sum_me = 0
    split_string.each do |x|
      if x.length < 4
        sum_me += x.to_i
      end
    end
    sum_me
  end

  def return_negatives(negatives)
    negative_string = ""
    negatives.each do |x|
      negative_string += (", " + x)
    end
    raise "Negatives not allowed" + negative_string
  end
end
