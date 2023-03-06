# frozen_string_literal: true

xml.instruct!

xml.Fall do
  xml.Bilder do
    @notice.photos.each do |photo|
      xml.comment! "Dateiname -> Filename of E-Mail Attachment Image"
      xml.comment! "Length -> byte_size of Image"
      xml.Bild Length: photo.byte_size, Dateiname: photo.key
    end
  end
  xml.Beteiligte do
    xml.Beteiligter Funktion: "keine", Typ: "Anzeigenerstatter" do
      xml.Kontakt do
        xml.Anschrift do
          xml.comment! "Default is '-' weg.li does use salutations"
          xml.Anrede "-"
          xml.Vorname @user.first_name
          xml.Name @user.last_name
          xml.Strasse @user.street_without_housenumber
          xml.Hausnummer @user.housenumber
          xml.Adresszusatz @user.appendix
          xml.PLZ @user.zip
          xml.Ort @user.city
          xml.Landeskennzeichen "D"
        end
        xml.EMail @user.email
        xml.Telefon @user.phone
        xml.Zusatzdaten { xml.Geburtsdatum @user.date_of_birth }
      end
    end
  end
  xml.Bemerkungen do
    xml.Bemerkung @notice.note if @notice.note
    Notice.details.each do |flag|
      if @notice.send(flag)
        xml.Bemerkung t(flag, scope: "activerecord.attributes.notice.flags")
      end
    end
    xml.Bemerkung @notice.wegli_email
  end
  xml.Falldaten do
    xml.Fahrzeug do
      xml.Nationalitaet "D"
      xml.comment! "Possible values: #{Vehicle.colors.map { |color| color_name(color) }.join(',')}"
      xml.comment! "List is not updated"
      xml.Farbe color_name(@notice.color.presence)
      xml.comment! "Possible values: #{Vehicle.brands.join(',')}"
      xml.comment! "List is updated"
      xml.Fabrikat @notice.brand
      xml.Kennzeichen @notice.registration
      xml.comment! "Default is '00'"
      xml.Kennzeichenart "00"
    end
    xml.Tattag do
      xml.Von l(@notice.date, format: :date)
      xml.Bis l(@notice.date + @notice.duration.minutes, format: :date)
    end
    xml.Tatzeit do
      xml.Von l(@notice.date, format: :time)
      xml.Bis l(@notice.date + @notice.duration.minutes + 1, format: :time)
    end
  end
  xml.Zeuge { xml.Zeilen { xml.Zeile @user.name } }
  xml.Beweise { xml.Beweis "Zeugin/Zeuge, Fotos" }
  xml.Tatdaten do
    xml.Vorwurf do
      xml.Tatbestandsnummer @notice.tbnr
      xml.VorwurfText @notice.charge
      xml.MitBehinderung @notice.standard? ? 0 : 1
    end
  end
  xml.Tatorte do
    xml.Tatort @notice.location_and_address
    xml.comment! "Geocoordinates"
    xml.Latitude @notice.latitude
    xml.Longitude @notice.longitude
  end
end
