class Api::Upload < ActiveStorage::Blob
  include Swagger::Blocks

  swagger_schema :Upload do
    key :required, [:filename, :byte_size, :checksum, :content_type]
    property :filename do
      key :type, :string
    end
    property :byte_size do
      key :type, :number
      key :format, :int64
    end
    property :checksum do
      key :type, :string
    end
    property :content_type do
      key :type, :string
    end
    property :metadata do
      key :type, :object
    end
  end

  swagger_schema :UploadInput do
    allOf do
      schema do
        key :'$ref', :Upload
      end
      schema do
        key :required, %i(filename byte_size checksum content_type)
      end
    end
  end

  def direct_upload_json
    as_json(methods: :signed_id).merge(direct_upload: {
      url: blob.service_url_for_direct_upload,
      headers: blob.service_headers_for_direct_upload
    })
  end
end
