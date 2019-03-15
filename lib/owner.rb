class Owner
  attr_reader :species
  attr_accessor :name, :pets

  @@all = []

  def initialize(species)
    @species = species
    @pets = {
      :fishes => [], :dogs => [], :cats => [],
    }
    @@all << self
  end

  def self.all
    @@all
  end

  def self.count
    @@all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    "I am a #{@species}."
  end

  def name=(name)
    @name = name
  end

  def buy_fish(name)
    fishy = Fish.new(name)
    @pets[:fishes] << fishy
  end

  def buy_cat(name)
    kitty = Cat.new(name)
    @pets[:cats] << kitty
  end

  def buy_dog(name)
    puppy = Dog.new(name)
    @pets[:dogs] << puppy
  end

  def walk_dogs
    @pets[:dogs].each do |item|
      item.mood = "happy"
    end
  end

  def play_with_cats
    @pets[:cats].each do |item|
      item.mood = "happy"
    end
  end

  def feed_fish
    @pets[:fishes].each do |item|
      item.mood = "happy"
    end
  end

  require "pry"

  def sell_pets
    @pets.each do |key, value|
      value.each do |i|
        i.mood = "nervous"
      end
    end
    @pets = []
  end

  def list_pets
    "I have #{@pets[:fishes].length} fish, #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end
end
