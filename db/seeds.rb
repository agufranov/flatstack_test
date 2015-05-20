# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Event.destroy_all
User.destroy_all
User.create! :email => 'a@a.a', :password => '123123123', :password_confirmation => '123123123', :name => 'Alice'
User.create! :email => 'b@b.b', :password => '123123123', :password_confirmation => '123123123', :name => 'Bob'
Event.create! :name => 'Только сегодня!', :start_at => Date.today.advance(:days => 3), :interval => :once, :user => User.first
Event.create! :name => 'Ежедневное', :start_at => Date.today.advance(:days => -4), :interval => :day, :user => User.last
Event.create! :name => 'Уикенд', :start_at => Date.today.advance(:weeks => -2), :interval => :week, :user => User.first
Event.create! :name => 'Каждый месяц', :start_at => Date.today.advance(:months => -3, :days => 2), :interval => :month, :user => User.last
Event.create! :name => 'Новый год', :start_at => Date.today.advance(:days => 5), :interval => :year, :user => User.first
