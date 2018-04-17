namespace :tier_list_types do
  desc "Create the Tier List Types"
  task create: :environment do
    tier_list_strings = ["Training Camp", "Goblin Stadium", "Bone Pit", "Barbarian Bowl", "P.E.K.K.A's Playhouse", "Spell Valley", "Builder's Workshop", "Royal Arena", "Frozen Peak", "Jungle Arena", "Hog Mountain", "Electro Valley", "Legendary Arena", "Tournament Capped", "2 vs 2", "Draft", "Touchdown", "Double Elixir"]

    puts "Creating TierListTypes #{tier_list_strings.join(', ')}"

    tier_list_strings.each do |name|
      TierListType.objects.create(name: name).first_or_create
    end
  end
end
