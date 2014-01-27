namespace :export do

  desc 'Puts Meals.all in a seeds.rb-friendly format'
  task :seeds_format => :environment do
    Meal.order(:id).all.each do |meal|
      puts "Meal.create(#{meal.serializable_hash.delete_if {|k, v| %w(created_at updated_at id).include?(key)}.to_s.gsub(/[{}]/, '')})"
    end
  end
end