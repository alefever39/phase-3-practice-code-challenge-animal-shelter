class Pet < ActiveRecord::Base
  belongs_to :adopter
  belongs_to :shelter

  def self.oldest
    self.all.max_by { |pet| pet.age }
  end

  def self.average_age
    self.all.sum { |pet| pet.age } / self.all.count
  end

  def in_dog_years
    self.age * 5
  end
end
