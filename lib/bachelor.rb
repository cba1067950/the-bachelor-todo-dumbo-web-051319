require 'pry'
test_hash = { 
  "season 30": [
  	{
  	"name": "Beth Smalls",
  	"age": "26",
  	"hometown": "Great Falls, Virginia",
  	"occupation":"Nanny/Freelance Journalist",
  	"status": "Winner"
	  },
	  {
	  "name": "Becca Tilley",
	  "age": "27",
	  "hometown": "Shreveport, Louisiana",
  	"occupation": "Chiropractic Assistant",
  	"status": "Eliminated Week 8"
	  }
	  ],	
  "season 29": [
	  {
	  "name": "Ashley Yeats",
	  "age": "24",
	  "hometown": "Denver, Colorado",
	  "occupation":"Dental Assitant",
	  "status": "Winner"
	  },
	  {
	  "name": "Sam Grover",
	  "age": "29",
	  "hometown": "New York, New York",
  	 "occupation": "Entertainer",
	  "status": "Eliminated Week 6"
	  }
    ]
}


def get_first_name_of_season_winner(data, season)
  # code here
  name = ""
  status = ""
  data.each do |seasons, profiles_array|
    if seasons.to_s == season
      profiles_array.each do |profile_hash|
        status = profile_hash.fetch("status")
        if status == "Winner" 
          name = profile_hash.fetch("name")
        end
      end
    end
  end
  name.gsub!(/\s.+/, "")
end

def get_contestant_name(data, occupation)
  # code here
  name = ""
  data.each do |seasons, profiles_array|
    profiles_array.each do |profile_hash|
      if profile_hash.fetch("occupation") == occupation
        name = profile_hash.fetch("name")
      end
    end
  end
  name
end

def count_contestants_by_hometown(data, hometown)
  # code here
  count = 0
  data.each do |seasons, profiles_array|
    profiles_array.each do |profile_hash|
      if profile_hash.fetch("hometown") == hometown
        count += 1 
      end
    end
  end
  count 
end

def get_occupation(data, hometown)
  # code here
  occupation = ""
  data.each do |season, profiles_array|
    profiles_array.each do |profile_hash|
      if profile_hash.fetch("hometown") == hometown
        occupation = profile_hash.fetch("occupation")
        return occupation
      end
    end
  end
end

def get_average_age_for_season(data, season)
  # code here
  tally = 0 
  count = 0 
  data.each do |seasons, profiles_array|
    if seasons == season
      profiles_array.each do |profiles_hash|
        age = profiles_hash.fetch("age")
        tally += age.to_i
        count += 1 
      end
    end
  end
  binding.pry
  (tally / count).ceil
end

get_average_age_for_season(test_hash)
