class Adopter < ActiveRecord::Base
  has_many :pets
  has_many :shelters, through: :pets

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  def adopt(pet)
    if (!pet.adopted?)
      pet.update(adopted?: true)
      self.pets << pet
    end
  end

  def fav_pet
    if (self.pets.count > 0)
      self
        .pets
        .group_by { |pet| pet.species }
        .max_by { |species, value| value.count }[
        0
      ]
    end
  end

  def self.most_pets
    self.all.group_by { |adopter| adopter.pets.count }.max[1]
  end
end
