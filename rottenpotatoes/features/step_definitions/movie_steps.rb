Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |movie, director|
  step %Q{I should see "#{movie}"}
  step %Q{I should see "#{director}"}
end

When /I check the following ratings:(.*)$/ do | rating_list|
  rating_list.split.each do |rating|
		step %Q{I check "ratings_#{rating}"}
  end
end

When /I uncheck the following ratings:(.*)$/ do | rating_list|
  rating_list.split.each do |rating|
		step %Q{I uncheck "ratings_#{rating}"}
  end
end


Then /^I should not see the following movies: (.*)$/ do |movies|
	movies.split(",").each do |film|
		step %Q{I should not see "#{film}"} 
  end
end

Then /^I should see the following movies: (.*)$/ do |movies|
	movies.split(",").each do |film|
		step %Q{I should see "#{film}"} 
  end
end


Then /^I should see all the movies/ do
  # Make sure that all the movies in the app are visible in the table
		Movie.all.each  do |movie|
			step %Q{I should see "#{movie.title}"}
		end
end
		
Then /^I should see "(.*)" before "(.*)"$/ do |e1, e2|
	/#{e1}.*#{e2}/=== page.body 
end