class Show < ActiveRecord::Base 
  
 # attr_accessor :name , :day , :network ,:rating , :season 
  
  def self.highest_rating
    Show.maximum(:rating)
  end 
  
  def self.most_popular_show
    Show.select('rating, count(1)').having('Max(rating)').first

  end

  def self.lowest_rating
     Show.minimum(:rating)
  end 

  def self.least_popular_show
  
   Show.first(:order => 'rating asc')
  end

  def self.ratings_sum 
   Show.sum(:rating)
  end 

  def self.popular_shows
    Show.where("rating > ?",5)

  end 

  def self.shows_by_alphabetical_order
   Show.order(:name)
  end 
  
  def self.clear_all
    Show.all.clear 
  end 
  
end 