class Review < ActiveRecord::Base
  attr_accessible :Address, :City , :Comment, :Date_of_Visit, :Phone, :Rating, :Member, :Venue_Name
  validates :Comment, :length => { :maximum => 140}, presence: true
validates :Address, :length => { :maximum => 50}
validates :Member, presence: true
validates :City, presence: true

validates :Venue_Name, presence: true
CITY = ['Hamilton', 'Tauranga']
RATING = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]




def self.search(search)
  if search
    find(:all, :conditions => ['Venue_Name LIKE ?', "%#{search}%"])
  else
    find(:all)
  end
end



end
