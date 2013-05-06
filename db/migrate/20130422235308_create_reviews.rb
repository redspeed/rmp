class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :User
      t.decimal :Rating
      t.string :Venue_Name
      t.text :Address
      t.string :City
      t.decimal :Phone
      t.date :Date_of_Visit
      t.text :Comment

      t.timestamps
    end
  end
end
