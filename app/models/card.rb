class Card < ApplicationRecord
  CARD_TYPES = {
    1 => {
      "name" => "Troop"
    },
    2 => {
      "name" => "Building Troop",
    },
    3 => {
      "name" => "Spell",
    },
    4 => {
      "name" => "Building",
    }
  }

  RARITIES = {
    1 => {
      "name" => "Common"
    },
    2 => {
      "name" => "Rare",
    },
    3 => {
      "name" => "Epic",
    },
    4 => {
      "name" => "Legendary",
    }
  }

  ARENAS = {
    0 => {
      "name" => "Training Camp"
    },
    1 => {
      "name" => "Goblin Stadium (0-399 Trophies)"
    },
    2 => {
      "name" => "Bone Pit (400-799 Trophies)"
    },
    3 => {
      "name" => "Barbarian Bowl (800-1099 Trophies)"
    },
    4 => {
      "name" => "P.E.K.K.A's Playhouse (1100-1399 Trophies)"
    },
    5 => {
      "name" => "Spell Valley (1400-1699 Trophies)"
    },
    6 => {
      "name" => "Builder's Workshop (1700-1999 Trophies)"
    },
    7 => {
      "name" => "Royal Arena (2000-2299 Trophies)"
    },
    8 => {
      "name" => "Frozen Peak (2300-2599 Trophies)"
    },
    9 => {
      "name" => "Jungle Arena (2600-2999 Trophies)"
    },
    10 => {
      "name" => "Hog Mountain (3000-3399 Trophies)"
    },
    11 => {
      "name" => "Electro Valley (3400-3799 Trophies)"
    },
    12 => {
      "name" => "Legendary Arena (3800+ Trophies)"
    }
  }

end
