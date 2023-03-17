# frozen_string_literal: true

class Api::Notice < Notice
  include Swagger::Blocks

  swagger_schema :Notice do
    key :required, [:token]
    property :token do
      key :type, :string
    end
    property :status do
      key :type, :string
      key :enum, Notice.statuses.keys
    end
    property :street do
      key :type, :string
    end
    property :city do
      key :type, :string
    end
    property :zip do
      key :type, :string
      key :pattern, '^\d{5}$'
    end
    property :latitude do
      key :type, :number
      key :format, :float
    end
    property :longitude do
      key :type, :number
      key :format, :float
    end
    property :registration do
      key :type, :string
    end
    property :brand do
      key :type, :string
      key :enum, Vehicle.brands
    end
    property :color do
      key :type, :string
      key :enum, Vehicle.colors
    end
    property :tbnr do
      key :type, :string
      key :enum, Charge.parking.pluck(:tbnr)
    end
    property :date do
      key :type, :string
      key :format, :"date-time"
    end
    property :duration do
      key :type, :number
      key :format, :int64
      key :enum, Vehicle.durations.map(&:last)
    end
    property :note do
      key :type, :string
    end
    property :created_at do
      key :type, :string
      key :format, :"date-time"
    end
    property :updated_at do
      key :type, :string
      key :format, :"date-time"
    end
    property :sent_at do
      key :type, :string
      key :format, :"date-time"
    end
    Notice.bitfields[:flags].each_key do |it|
      property it do
        key :type, :boolean
        key :default, false
      end
    end
    property :photos do
      key :type, :array
      items do
        key :type, :object
        property :filename do
          key :type, :string
        end
        property :url do
          key :type, :string
        end
      end
    end
  end

  swagger_schema :NoticeInput do
    allOf do
      schema { key :$ref, :Notice }
      schema do
        key :required,
            %i[
              token
              street
              city
              zip
              latitude
              longitude
              registration
              charge
              date
              duration
              severity
              photos
            ]
        property :token do
          key :type, :string
        end
      end
    end
  end
end
