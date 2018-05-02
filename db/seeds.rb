def create_seed_users
  clyde = User.find_or_create_by(username: "Clyde", email_address: "clyde@crapp.com")
  clyde.update(password: "123456", password_confirmation: "123456")
  bonnie = User.find_or_create_by(username: "Bonnie", email_address: "bonnie@crapp.com")
  bonnie.update(password: "123456", password_confirmation: "123456")
  tc = User.find_or_create_by(username: "Trainer Chris", email_address: "tc@crapp.com")
  tc.update(password: "123456", password_confirmation: "123456")
  cmchugh = User.find_or_create_by(username: "CMcHugh", email_address: "cmchugh@crapp.com")
  cmchugh.update(password: "123456", password_confirmation: "123456")
  woody = User.find_or_create_by(username: "Woody", email_address: "woody@crapp.com")
  woody.update(password: "123456", password_confirmation: "123456")
  random = User.find_or_create_by(username: "Random User", email_address: "random@crapp.com")
  random.update(password: "123456", password_confirmation: "123456")
end

def create_seed_tier_lists
  users = User.all
  cards = Card.all
  cards_per_tier = cards.length / 6

  TierListType.all.each do |list_type|
    Array(1..30).each do |num|
      random_user = users.sample
      included_cards = []

      tier_one_cards = cards.sample(cards_per_tier).pluck(:id)
      included_cards += tier_one_cards

      tier_two_cards = cards.where.not(id: included_cards).sample(cards_per_tier).pluck(:id)
      included_cards += tier_two_cards

      tier_three_cards = cards.where.not(id: included_cards).sample(cards_per_tier).pluck(:id)
      included_cards += tier_three_cards

      tier_four_cards = cards.where.not(id: included_cards).sample(cards_per_tier).pluck(:id)
      included_cards += tier_four_cards

      tier_five_cards = cards.where.not(id: included_cards).sample(cards_per_tier).pluck(:id)
      included_cards += tier_five_cards

      tier_six_cards = cards.where.not(id: included_cards).pluck(:id)

      tier_list = TierList.find_or_create_by(
        user_id: random_user.id,
        title: "#{random_user.username}'s Tournament Tier List #{num * random_user.id}",
        description: "Some random description by #{random_user.username} number #{num}",
        upvotes: rand(100)
      )
      tiers = [
        {
          tier_list_id: tier_list.id,
          name: "S-tier",
          description: "The best cards in the game",
          notes: "Random notes!",
          position: 1,
          cards: tier_one_cards
        },
        {
          tier_list_id: tier_list.id,
          name: "A-tier",
          description: "These are almost the best",
          notes: "Random notes",
          position: 2,
          cards: tier_two_cards
        },
        {
          tier_list_id: tier_list.id,
          name: "B-tier",
          description: "The third best cards in the game",
          notes: "Random notes",
          position: 3,
          cards: tier_three_cards
        },
        {
          tier_list_id: tier_list.id,
          name: "C-tier",
          description: "The fourth best cards in the game",
          notes: "Random notes",
          position: 4,
          cards: tier_four_cards
        },
        {
          tier_list_id: tier_list.id,
          name: "D-tier",
          description: "Some of the worst cards",
          notes: "Random notes",
          position: 5,
          cards: tier_five_cards
        },
        {
          tier_list_id: tier_list.id,
          name: "F-tier",
          description: "The worst cards in the game",
          notes: "Random notes",
          position: 6,
          cards: tier_six_cards
        }
      ]
      tiers.each do |tier|
        Tier.find_or_create_by(**tier)
      end
      tier_list.tier_list_selected_types.create(tier_list_type: list_type)
    end
  end
end

def add_list_types_to_tier_lists
  # add tags to half of the tier lists
  tier_lists = TierList.all.sample(TierList.count / 2)
  max_list_types_added = TierListType.count - 1
  tier_lists.each do |tier_list|
    num_list_types_to_add = rand(max_list_types_added)
    list_types_to_add = TierListType.where.not(id: tier_list.tier_list_selected_types.pluck(:id)).sample(num_list_types_to_add)

    list_types_to_add.each do |list_type|
      tier_list.tier_list_selected_types.create(
        tier_list_type: list_type
      )
    end
  end
end

create_seed_users
add_list_types_to_tier_lists
create_seed_tier_lists
