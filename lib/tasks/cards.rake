require 'json'

namespace :cards do
  desc "Create cards"
  task create: :environment do
    cards_file = File.read('app/assets/cards.json')
    cards_hash = JSON.parse(cards_file)

    puts "Creating Cards (#{cards_hash.length} records)..."

    cards_hash.each do |card_hash|
      Card.find_or_create_by(card_hash)
    end
  end
end
