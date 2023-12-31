=begin
#weg-li Recommender API

#No description provided (generated by Openapi Generator https://github.com/openapitools/openapi-generator)

The version of the OpenAPI document: 0.1.0

Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.0.1

=end

require 'cgi'

module OpenapiClient
  class ReportApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # @param zipcode [String] 
    # @param [Hash] opts the optional parameters
    # @return [InlineResponse2002]
    def report_district_zipcode_get(zipcode, opts = {})
      data, _status_code, _headers = report_district_zipcode_get_with_http_info(zipcode, opts)
      data
    end

    # @param zipcode [String] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(InlineResponse2002, Integer, Hash)>] InlineResponse2002 data, response status code and response headers
    def report_district_zipcode_get_with_http_info(zipcode, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportApi.report_district_zipcode_get ...'
      end
      # verify the required parameter 'zipcode' is set
      if @api_client.config.client_side_validation && zipcode.nil?
        fail ArgumentError, "Missing the required parameter 'zipcode' when calling ReportApi.report_district_zipcode_get"
      end
      # resource path
      local_var_path = '/report/district/{zipcode}'.sub('{' + 'zipcode' + '}', CGI.escape(zipcode.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'InlineResponse2002'

      # auth_names
      auth_names = opts[:debug_auth_names] || []

      new_options = opts.merge(
        :operation => :"ReportApi.report_district_zipcode_get",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportApi#report_district_zipcode_get\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # @param inline_object1 [InlineObject1] 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def report_post(inline_object1, opts = {})
      report_post_with_http_info(inline_object1, opts)
      nil
    end

    # @param inline_object1 [InlineObject1] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Integer, Hash)>] nil, response status code and response headers
    def report_post_with_http_info(inline_object1, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ReportApi.report_post ...'
      end
      # verify the required parameter 'inline_object1' is set
      if @api_client.config.client_side_validation && inline_object1.nil?
        fail ArgumentError, "Missing the required parameter 'inline_object1' when calling ReportApi.report_post"
      end
      # resource path
      local_var_path = '/report'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(inline_object1)

      # return_type
      return_type = opts[:debug_return_type]

      # auth_names
      auth_names = opts[:debug_auth_names] || ['AccessTokenAuth']

      new_options = opts.merge(
        :operation => :"ReportApi.report_post",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ReportApi#report_post\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
