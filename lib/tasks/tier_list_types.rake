namespace :tier_list_types do
  desc "Create the Tier List Types"
  task create: :environment do
    tier_list_strings = ["Training Camp", "Goblin Stadium (0-399 Trophies)", "Bone Pit (400-799 Trophies)", "Barbarian Bowl (800-1099 Trophies)", "P.E.K.K.A's Playhouse (1100-1399 Trophies)", "Spell Valley (1400-1699 Trophies)", "Builder's Workshop (1700-1999 Trophies)", "Royal Arena (2000-2299 Trophies)", "Frozen Peak (2300-2599 Trophies)", "Jungle Arena (2600-2999 Trophies)", "Hog Mountain (3000-3399 Trophies)", "Electro Valley (3400-3799 Trophies)", "Legendary Arena (3800+ Trophies)", "Tournament Capped", "2 vs 2", "Draft", "Touchdown", "Double Elixir"]

    puts "Creating TierListTypes (#{tier_list_strings.join(', ')})..."

    tier_list_strings.each do |name|
      TierListType.find_or_create_by(name: name)
    end
  end
end
