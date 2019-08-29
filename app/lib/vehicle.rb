class Vehicle
  def self.data
    @data ||= {}
    @data[:cars] ||= JSON.load(Rails.root.join('config/data/cars.json'))
    @data[:plates] ||= JSON.load(Rails.root.join('config/data/plates.json'))
    @data
  end

  def self.trucks
    [
      'MAN',
      'Iveco',
      'CANIA',
      'DAF',
    ]
  end

  def self.cars
    data[:cars]
  end

  def self.plates
    data[:plates]
  end

  def self.plate?(text)
    text = text.strip.gsub(/\W+/,'-')
    if text =~ plate_regex
      "#{$1} #{$2} #{$3}"
    elsif text =~ relaxed_plate_regex
      "#{$1}#{$2}#{$3}"
    end
  end

  def self.plate_regex
    @plate_regex ||= Regexp.new("^(#{Vehicle.plates.keys.join('|')})-([A-Z]{1,3})-(\\d{1,4})$")
  end

  def self.relaxed_plate_regex
    @relaxed_plate_regex ||= Regexp.new("^(#{Vehicle.plates.keys.join('|')})([A-Z]{1,3})-(\\d{1,4})$")
  end

  def self.brand?(text)
    text = text.strip.downcase
    res = cars.find { |entry| text.match?(entry['brand'].strip.downcase) }
    return res['brand'] if res.present?

    res = cars.find do |entry|
      (entry['aliases'] || []).find { |ali| text.match?(ali.strip.downcase) }
    end
    return res['brand'] if res.present?

    res = cars.find do |entry|
      entry['models'].find { |model| model =~ /\D+/ && text == model.strip.downcase }
    end
    return res['brand'] if res.present?
  end

  def self.brands
    all = cars.map { |entry| entry['brand'] } + trucks

    all.sort
  end

  def self.models(brand)
    cars.find { |entry| entry['brand'] == brand }.dig('models')
  end

  def self.colors
    @colors ||= [
      'beige',
      'blue',
      'brown',
      'yellow',
      'grey',
      'green',
      'red',
      'black',
      'silver',
      'violet',
      'white',
      'orange',
      'gold',
    ]
  end

  def self.kinds
    @kinds ||= [
      'PKW',
      'LKW',
      'Motorrad',
    ]
  end

  def self.charges
    @charges = [
      'Parken auf Radfahrstreifen',
      'Parken auf Fahrradschutzstreifen',
      'Parken auf dem Gehweg',
      'Parken im Halteverbot',
      'Parken im eingeschränkten Halteverbot',
      'Parken auf Sperrflächen',
      'Parken auf Grünflächen',
      'Parken bis zu 10 Meter vor Lichtzeichen',
      'Parken auf dem Fußgängerüberweg sowie 5 Meter davor und dahinter',
      'Parken im Kreuzungs-/ Einmündungsbereich sowie 5 Meter davor und dahinter',
      'Parken vor abgesenkten Bordsteinen',
      'Parken vor Grundstücksein- und -ausfahrten',
      'Parken auf schmalen Straßen auch gegenüber von Grundstücksein- und -ausfahrten',
      'Parken an Haltestellen sowie 15 Meter davor und dahinter',
      'Parken auf der Busspur',
      'Parken im Kreisverkehr',
      'Parken in Fußgängerzonen',
      'Parken im verkehrsberuhigten Bereich',
      'Parken auf dem Behindertenparkplatz',
      'Parken in zweiter Reihe',
      'Parken vor und hinter Bahnübergängen mit Andreaskreuz',
      'Parken auf Straßen mit durchgezogener Linie',
      'Parken an Engstellen, wenn weniger als 3 Meter verbleiben würden',
      'Parken im Bereich von Verkehrs- bzw. Durchfahrtsverboten',
      'Fahrzeug blockiert Feuerwehrzufahrt',
      'Fahrzeug blockiert Elektroladesäule',
    ]
  end
end
