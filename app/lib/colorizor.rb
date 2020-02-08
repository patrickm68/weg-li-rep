class Colorizor
  COLORS = {
    Color::RGB::AliceBlue => Color::RGB::White,
    Color::RGB::AntiqueWhite => Color::RGB::Beige,
    Color::RGB::Aqua => Color::RGB::Blue,
    Color::RGB::Aquamarine => Color::RGB::Green,
    Color::RGB::Azure => Color::RGB::White,
    Color::RGB::Beige => Color::RGB::Beige,
    Color::RGB::Bisque => Color::RGB::Beige,
    Color::RGB::RebeccaPurple => Color::RGB::Purple,
    Color::RGB::Black => Color::RGB::Black,
    Color::RGB::BlanchedAlmond => Color::RGB::Beige,
    Color::RGB::Blue => Color::RGB::Blue,
    Color::RGB::BlueViolet => Color::RGB::Violet,
    Color::RGB::Brown => Color::RGB::Brown,
    Color::RGB::BurlyWood => Color::RGB::Beige,
    Color::RGB::CadetBlue => Color::RGB::Blue,
    Color::RGB::Carnation => Color::RGB::Violet,
    Color::RGB::Cayenne => Color::RGB::Red,
    Color::RGB::Chartreuse => Color::RGB::Green,
    Color::RGB::Chocolate => Color::RGB::Brown,
    Color::RGB::Coral => Color::RGB::Red,
    Color::RGB::CornflowerBlue => Color::RGB::Blue,
    Color::RGB::Cornsilk => Color::RGB::White,
    Color::RGB::Crimson => Color::RGB::Red,
    Color::RGB::Cyan => Color::RGB::Blue,
    Color::RGB::DarkBlue => Color::RGB::Blue,
    Color::RGB::DarkCyan => Color::RGB::Blue,
    Color::RGB::DarkGoldenRod => Color::RGB::Gold,
    Color::RGB::DarkGreen => Color::RGB::Green,
    Color::RGB::DarkKhaki => Color::RGB::Green,
    Color::RGB::DarkMagenta => Color::RGB::Purple,
    Color::RGB::DarkOliveGreen => Color::RGB::Green,
    Color::RGB::DarkOrange => Color::RGB::Orange,
    Color::RGB::DarkOrchid => Color::RGB::Purple,
    Color::RGB::DarkRed => Color::RGB::Red,
    Color::RGB::DarkSalmon => Color::RGB::Red,
    Color::RGB::DarkSeaGreen => Color::RGB::Green,
    Color::RGB::DarkSlateBlue => Color::RGB::Blue,
    Color::RGB::DarkTurquoise => Color::RGB::Blue,
    Color::RGB::DarkViolet => Color::RGB::Violet,
    Color::RGB::Darkorange => Color::RGB::Orange,
    Color::RGB::DeepPink => Color::RGB::Pink,
    Color::RGB::DeepSkyBlue => Color::RGB::Blue,
    Color::RGB::DodgerBlue => Color::RGB::Blue,
    Color::RGB::Feldspar => Color::RGB::Brown,
    Color::RGB::FireBrick => Color::RGB::Brown,
    Color::RGB::FloralWhite => Color::RGB::White,
    Color::RGB::ForestGreen => Color::RGB::Green,
    Color::RGB::Fuchsia => Color::RGB::Violet,
    Color::RGB::Gainsboro => Color::RGB::White,
    Color::RGB::GhostWhite => Color::RGB::White,
    Color::RGB::Gold => Color::RGB::Gold,
    Color::RGB::GoldenRod => Color::RGB::Gold,
    Color::RGB::Gray => Color::RGB::Gray,
    Color::RGB::Green => Color::RGB::Green,
    Color::RGB::GreenYellow => Color::RGB::Green,
    Color::RGB::HoneyDew => Color::RGB::White,
    Color::RGB::HotPink => Color::RGB::Pink,
    Color::RGB::IndianRed => Color::RGB::Red,
    Color::RGB::Indigo => Color::RGB::Purple,
    Color::RGB::Ivory => Color::RGB::White,
    Color::RGB::Khaki => Color::RGB::Green,
    Color::RGB::Lavender => Color::RGB::Beige,
    Color::RGB::LavenderBlush => Color::RGB::White,
    Color::RGB::LawnGreen => Color::RGB::Green,
    Color::RGB::LemonChiffon => Color::RGB::Yellow,
    Color::RGB::LightBlue => Color::RGB::Blue,
    Color::RGB::LightCoral => Color::RGB::Red,
    Color::RGB::LightCyan => Color::RGB::Blue,
    Color::RGB::LightGoldenRodYellow => Color::RGB::Gold,
    Color::RGB::LightGreen => Color::RGB::Green,
    Color::RGB::LightPink => Color::RGB::Pink,
    Color::RGB::LightSalmon => Color::RGB::Red,
    Color::RGB::LightSeaGreen => Color::RGB::Green,
    Color::RGB::LightSkyBlue => Color::RGB::Blue,
    Color::RGB::LightSlateBlue => Color::RGB::Blue,
    Color::RGB::LightSteelBlue => Color::RGB::Silver,
    Color::RGB::LightYellow => Color::RGB::Yellow,
    Color::RGB::Lime => Color::RGB::Green,
    Color::RGB::LimeGreen => Color::RGB::Green,
    Color::RGB::Linen => Color::RGB::White,
    Color::RGB::Magenta => Color::RGB::Violet,
    Color::RGB::Maroon => Color::RGB::Red,
    Color::RGB::MediumAquaMarine => Color::RGB::Green,
    Color::RGB::MediumBlue => Color::RGB::Blue,
    Color::RGB::MediumOrchid => Color::RGB::Violet,
    Color::RGB::MediumPurple => Color::RGB::Purple,
    Color::RGB::MediumSeaGreen => Color::RGB::Green,
    Color::RGB::MediumSlateBlue => Color::RGB::Blue,
    Color::RGB::MediumSpringGreen => Color::RGB::Green,
    Color::RGB::MediumTurquoise => Color::RGB::Blue,
    Color::RGB::MediumVioletRed => Color::RGB::Violet,
    Color::RGB::MidnightBlue => Color::RGB::Blue,
    Color::RGB::MintCream => Color::RGB::White,
    Color::RGB::MistyRose => Color::RGB::Beige,
    Color::RGB::Moccasin => Color::RGB::Beige,
    Color::RGB::NavajoWhite => Color::RGB::Beige,
    Color::RGB::Navy => Color::RGB::Blue,
    Color::RGB::OldLace => Color::RGB::Beige,
    Color::RGB::Olive => Color::RGB::Green,
    Color::RGB::OliveDrab => Color::RGB::Green,
    Color::RGB::Orange => Color::RGB::Orange,
    Color::RGB::OrangeRed => Color::RGB::Red,
    Color::RGB::Orchid => Color::RGB::Violet,
    Color::RGB::PaleGoldenRod => Color::RGB::Gold,
    Color::RGB::PaleGreen => Color::RGB::Green,
    Color::RGB::PaleTurquoise => Color::RGB::Blue,
    Color::RGB::PaleVioletRed => Color::RGB::Violet,
    Color::RGB::PapayaWhip => Color::RGB::Beige,
    Color::RGB::PeachPuff => Color::RGB::Beige,
    Color::RGB::Peru => Color::RGB::Brown,
    Color::RGB::Pink => Color::RGB::Pink,
    Color::RGB::Plum => Color::RGB::Violet,
    Color::RGB::PowderBlue => Color::RGB::Blue,
    Color::RGB::Purple => Color::RGB::Purple,
    Color::RGB::Red => Color::RGB::Red,
    Color::RGB::RosyBrown => Color::RGB::Brown,
    Color::RGB::RoyalBlue => Color::RGB::Blue,
    Color::RGB::SaddleBrown => Color::RGB::Brown,
    Color::RGB::Salmon => Color::RGB::Red,
    Color::RGB::SandyBrown => Color::RGB::Brown,
    Color::RGB::SeaGreen => Color::RGB::Green,
    Color::RGB::SeaShell => Color::RGB::White,
    Color::RGB::Sienna => Color::RGB::Brown,
    Color::RGB::Silver => Color::RGB::Silver,
    Color::RGB::SkyBlue => Color::RGB::Blue,
    Color::RGB::SlateBlue => Color::RGB::Blue,
    Color::RGB::Snow => Color::RGB::White,
    Color::RGB::SpringGreen => Color::RGB::Green,
    Color::RGB::SteelBlue => Color::RGB::Blue,
    Color::RGB::Tan => Color::RGB::Beige,
    Color::RGB::Teal => Color::RGB::Green,
    Color::RGB::Thistle => Color::RGB::Violet,
    Color::RGB::Tomato => Color::RGB::Red,
    Color::RGB::Turquoise => Color::RGB::Green,
    Color::RGB::Violet => Color::RGB::Violet,
    Color::RGB::VioletRed => Color::RGB::Violet,
    Color::RGB::Wheat => Color::RGB::Beige,
    Color::RGB::White => Color::RGB::White,
    Color::RGB::WhiteSmoke => Color::RGB::White,
    Color::RGB::Yellow => Color::RGB::Yellow,
    Color::RGB::YellowGreen => Color::RGB::Green,
    Color::RGB::Metallic::CoolCopper => Color::RGB::Gold,
    Color::RGB::Metallic::Copper => Color::RGB::Gold,
    Color::RGB::Metallic::Poly => Color::RGB::Brown,
  }

  TOTALS = {
    Color::RGB::Gray10 => Color::RGB::Gray,
    Color::RGB::Gray20 => Color::RGB::Gray,
    Color::RGB::Gray30 => Color::RGB::Gray,
    Color::RGB::Gray40 => Color::RGB::Gray,
    Color::RGB::Gray50 => Color::RGB::Gray,
    Color::RGB::Gray60 => Color::RGB::Gray,
    Color::RGB::Gray70 => Color::RGB::Gray,
    Color::RGB::Gray80 => Color::RGB::Gray,
    Color::RGB::Gray90 => Color::RGB::Gray,

    Color::RGB::Metallic::Aluminum => Color::RGB::Silver,
    Color::RGB::Metallic::Iron => Color::RGB::Silver,
    Color::RGB::Metallic::Lead => Color::RGB::Black,
    Color::RGB::Metallic::Magnesium => Color::RGB::Silver,
    Color::RGB::Metallic::Mercury => Color::RGB::Silver,
    Color::RGB::Metallic::Nickel => Color::RGB::Silver,
    Color::RGB::Metallic::Silver => Color::RGB::Silver,
    Color::RGB::Metallic::Steel => Color::RGB::Silver,
    Color::RGB::Metallic::Tin => Color::RGB::Silver,
    Color::RGB::Metallic::Tungsten => Color::RGB::Silver,
  }.merge(COLORS)

  def self.closest_match(color)
    rgb = Color::RGB.new(color[:red], color[:green], color[:blue])
    closest = rgb.closest_match(COLORS.keys, 20) || rgb.closest_match(TOTALS.keys)
    TOTALS[closest].name
  end
end
