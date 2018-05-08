class Card < ApplicationRecord
  CARD_TYPES = {
    1 => {
      "id" => 1,
      "name" => "Troop"
    },
    2 => {
      "id" => 2,
      "name" => "Building Troop",
    },
    3 => {
      "id" => 3,
      "name" => "Spell",
    },
    4 => {
      "id" => 4,
      "name" => "Building",
    }
  }

  RARITIES = {
    1 => {
      "id" => 1,
      "name" => "Common"
    },
    2 => {
      "id" => 2,
      "name" => "Rare",
    },
    3 => {
      "id" => 3,
      "name" => "Epic",
    },
    4 => {
      "id" => 4,
      "name" => "Legendary",
    }
  }

  ARENAS = {
    1 => {
      "id" => 1,
      "name" => "Training Camp"
    },
    2 => {
      "id" => 2,
      "name" => "Goblin Stadium (0-399 Trophies)"
    },
    3 => {
      "id" => 3,
      "name" => "Bone Pit (400-799 Trophies)"
    },
    4 => {
      "id" => 4,
      "name" => "Barbarian Bowl (800-1099 Trophies)"
    },
    5 => {
      "id" => 5,
      "name" => "P.E.K.K.A's Playhouse (1100-1399 Trophies)"
    },
    6 => {
      "id" => 6,
      "name" => "Spell Valley (1400-1699 Trophies)"
    },
    7 => {
      "id" => 7,
      "name" => "Builder's Workshop (1700-1999 Trophies)"
    },
    8 => {
      "id" => 8,
      "name" => "Royal Arena (2000-2299 Trophies)"
    },
    9 => {
      "id" => 9,
      "name" => "Frozen Peak (2300-2599 Trophies)"
    },
    10 => {
      "id" => 10,
      "name" => "Jungle Arena (2600-2999 Trophies)"
    },
    11 => {
      "id" => 11,
      "name" => "Hog Mountain (3000-3399 Trophies)"
    },
    12 => {
      "id" => 12,
      "name" => "Electro Valley (3400-3799 Trophies)"
    },
    13 => {
      "id" => 13,
      "name" => "Legendary Arena (3800+ Trophies)"
    }
  }

  def self.CARD_TYPES
    CARD_TYPES
  end

  def self.RARITIES
    RARITIES
  end

  def self.ARENAS
    ARENAS
  end
end
