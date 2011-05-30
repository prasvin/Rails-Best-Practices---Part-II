# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

#create sample users
User.create(:login => "Matthew", :password => "matt", :password_confirmation => "matt")
User.create(:login => "Gregory", :password => "greg", :password_confirmation => "greg")

#sample post
User.first.posts.create(:title => "Hello World", :text => "My first blog post.")

# sample users with addresses
User.first.create_address(:country=>"USA",:city => "NY")
user = User.last
User.last.create_address(:country=>"Canada",:city => "AB")