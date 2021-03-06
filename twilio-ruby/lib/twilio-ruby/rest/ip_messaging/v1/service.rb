##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class IpMessaging < Domain
      class V1 < Version
        class ServiceList < ListResource
          ##
          # Initialize the ServiceList
          # @param [Version] version Version that contains the resource
          # @return [ServiceList] ServiceList
          def initialize(version)
            super(version)
            
            # Path Solution
            @solution = {}
            @uri = "/Services"
          end
          
          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] friendly_name The friendly_name
          # @return [ServiceInstance] Newly created ServiceInstance
          def create(friendly_name: nil)
            data = {
                'FriendlyName' => friendly_name,
            }
            
            payload = @version.create(
                'POST',
                @uri,
                data: data
            )
            
            return ServiceInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Lists ServiceInstance records from the API as a list.
          # Unlike stream(), this operation is eager and will load `limit` records into
          # memory before returning.
          # @param [Integer] limit Upper limit for the number of records to return. stream()
          #                   guarantees to never return more than limit.  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
          #  the default value of 50 records.  If no page_size is                      defined
          #  but a limit is defined, stream() will attempt to read                      the
          #  limit with the most efficient page size,                      i.e. min(limit, 1000)
          # @return [Array] Array of up to limit results
          def list(limit: nil, page_size: nil)
            self.stream(
                limit: limit,
                page_size: page_size
            ).entries
          end
          
          ##
          # Streams ServiceInstance records from the API as an Enumerable.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to                      read the
          #  limit with the most efficient page size,                       i.e. min(limit, 1000)
          # @return [Enumerable] Enumerable that will yield up to limit results
          def stream(limit: nil, page_size: nil)
            limits = @version.read_limits(limit, page_size)
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
          end
          
          ##
          # When passed a block, yields ServiceInstance records from the API.
          # This operation lazily loads records as efficiently as possible until the limit
          # is reached.
          # @param [Integer] limit Upper limit for the number of records to return.                  stream()
          #  guarantees to never return more than limit.                  Default is no limit
          # @param [Integer] page_size Number of records to fetch per request, when                       not set will use
          #  the default value of 50 records.                      If no page_size is defined
          #                       but a limit is defined, stream() will attempt to read the
          #                       limit with the most efficient page size, i.e. min(limit, 1000)
          def each
            limits = @version.read_limits
            
            page = self.page(
                page_size: limits['page_size'],
            )
            
            @version.stream(page,
                            limit: limits['limit'],
                            page_limit: limits['page_limit']).each {|x| yield x}
          end
          
          ##
          # Retrieve a single page of ServiceInstance records from the API.
          # Request is executed immediately.
          # @param [String] page_token PageToken provided by the API
          # @param [Integer] page_number Page Number, this value is simply for client state
          # @param [Integer] page_size Number of records to return, defaults to 50
          # @return [Page] Page of ServiceInstance
          def page(page_token: nil, page_number: nil, page_size: nil)
            params = {
                'PageToken' => page_token,
                'Page' => page_number,
                'PageSize' => page_size,
            }
            response = @version.page(
                'GET',
                @uri,
                params
            )
            return ServicePage.new(@version, response, @solution)
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '#<Twilio.IpMessaging.V1.ServiceList>'
          end
        end
      
        class ServicePage < Page
          ##
          # Initialize the ServicePage
          # @param [Version] version Version that contains the resource
          # @param [Response] response Response from the API
          # @param [Hash] solution Path solution for the resource
          # @return [ServicePage] ServicePage
          def initialize(version, response, solution)
            super(version, response)
            
            # Path Solution
            @solution = solution
          end
          
          ##
          # Build an instance of ServiceInstance
          # @param [Hash] payload Payload response from the API
          # @return [ServiceInstance] ServiceInstance
          def get_instance(payload)
            return ServiceInstance.new(
                @version,
                payload,
            )
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            '<Twilio.IpMessaging.V1.ServicePage>'
          end
        end
      
        class ServiceContext < InstanceContext
          ##
          # Initialize the ServiceContext
          # @param [Version] version Version that contains the resource
          # @param [String] sid The sid
          # @return [ServiceContext] ServiceContext
          def initialize(version, sid)
            super(version)
            
            # Path Solution
            @solution = {
                sid: sid,
            }
            @uri = "/Services/#{@solution[:sid]}"
            
            # Dependents
            @channels = nil
            @roles = nil
            @users = nil
          end
          
          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            params = {}
            
            payload = @version.fetch(
                'GET',
                @uri,
                params,
            )
            
            return ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end
          
          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            return @version.delete('delete', @uri)
          end
          
          ##
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] default_service_role_sid The default_service_role_sid
          # @param [String] default_channel_role_sid The default_channel_role_sid
          # @param [String] default_channel_creator_role_sid The
          #   default_channel_creator_role_sid
          # @param [Boolean] read_status_enabled The read_status_enabled
          # @param [String] typing_indicator_timeout The typing_indicator_timeout
          # @param [String] consumption_report_interval The consumption_report_interval
          # @param [Hash] webhooks The webhooks
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: nil, default_service_role_sid: nil, default_channel_role_sid: nil, default_channel_creator_role_sid: nil, read_status_enabled: nil, typing_indicator_timeout: nil, consumption_report_interval: nil, webhooks: nil)
            data = {
                'FriendlyName' => friendly_name,
                'DefaultServiceRoleSid' => default_service_role_sid,
                'DefaultChannelRoleSid' => default_channel_role_sid,
                'DefaultChannelCreatorRoleSid' => default_channel_creator_role_sid,
                'ReadStatusEnabled' => read_status_enabled,
                'TypingIndicatorTimeout' => typing_indicator_timeout,
                'ConsumptionReportInterval' => consumption_report_interval,
                'Webhooks' => webhooks,
            }
            
            payload = @version.update(
                'POST',
                @uri,
                data: data,
            )
            
            return ServiceInstance.new(
                @version,
                payload,
                sid: @solution[:sid],
            )
          end
          
          ##
          # Access the channels
          # @return [ChannelList] ChannelList
          def channels(sid=:unset)
            if sid != :unset
              return ChannelContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @channels
              @channels = ChannelList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end
            
            @channels
          end
          
          ##
          # Access the roles
          # @return [RoleList] RoleList
          def roles(sid=:unset)
            if sid != :unset
              return RoleContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @roles
              @roles = RoleList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end
            
            @roles
          end
          
          ##
          # Access the users
          # @return [UserList] UserList
          def users(sid=:unset)
            if sid != :unset
              return UserContext.new(
                  @version,
                  @solution[:sid],
                  sid,
              )
            end
            
            unless @users
              @users = UserList.new(
                  @version,
                  service_sid: @solution[:sid],
              )
            end
            
            @users
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
            "#<Twilio.IpMessaging.V1.ServiceContext #{context}>"
          end
        end
      
        class ServiceInstance < InstanceResource
          ##
          # Initialize the ServiceInstance
          # @param [Version] version Version that contains the resource
          # @param [Hash] payload payload that contains response from Twilio
          # @param [String] sid The sid
          # @return [ServiceInstance] ServiceInstance
          def initialize(version, payload, sid: nil)
            super(version)
            
            # Marshaled Properties
            @properties = {
                'sid' => payload['sid'],
                'account_sid' => payload['account_sid'],
                'friendly_name' => payload['friendly_name'],
                'date_created' => Twilio.deserialize_iso8601(payload['date_created']),
                'date_updated' => Twilio.deserialize_iso8601(payload['date_updated']),
                'default_service_role_sid' => payload['default_service_role_sid'],
                'default_channel_role_sid' => payload['default_channel_role_sid'],
                'default_channel_creator_role_sid' => payload['default_channel_creator_role_sid'],
                'read_status_enabled' => payload['read_status_enabled'],
                'typing_indicator_timeout' => payload['typing_indicator_timeout'].to_i,
                'consumption_report_interval' => payload['consumption_report_interval'].to_i,
                'webhooks' => payload['webhooks'],
                'url' => payload['url'],
                'links' => payload['links'],
            }
            
            # Context
            @instance_context = nil
            @params = {
                'sid' => sid || @properties['sid'],
            }
          end
          
          ##
          # Generate an instance context for the instance, the context is capable of
          # performing various actions.  All instance actions are proxied to the context
          # @param [Version] version Version that contains the resource
          # @return [ServiceContext] ServiceContext for this ServiceInstance
          def context
            unless @instance_context
              @instance_context = ServiceContext.new(
                  @version,
                  @params['sid'],
              )
            end
            @instance_context
          end
          
          def sid
            @properties['sid']
          end
          
          def account_sid
            @properties['account_sid']
          end
          
          def friendly_name
            @properties['friendly_name']
          end
          
          def date_created
            @properties['date_created']
          end
          
          def date_updated
            @properties['date_updated']
          end
          
          def default_service_role_sid
            @properties['default_service_role_sid']
          end
          
          def default_channel_role_sid
            @properties['default_channel_role_sid']
          end
          
          def default_channel_creator_role_sid
            @properties['default_channel_creator_role_sid']
          end
          
          def read_status_enabled
            @properties['read_status_enabled']
          end
          
          def typing_indicator_timeout
            @properties['typing_indicator_timeout']
          end
          
          def consumption_report_interval
            @properties['consumption_report_interval']
          end
          
          def webhooks
            @properties['webhooks']
          end
          
          def url
            @properties['url']
          end
          
          def links
            @properties['links']
          end
          
          ##
          # Fetch a ServiceInstance
          # @return [ServiceInstance] Fetched ServiceInstance
          def fetch
            context.fetch
          end
          
          ##
          # Deletes the ServiceInstance
          # @return [Boolean] true if delete succeeds, true otherwise
          def delete
            context.delete
          end
          
          ##
          # Update the ServiceInstance
          # @param [String] friendly_name The friendly_name
          # @param [String] default_service_role_sid The default_service_role_sid
          # @param [String] default_channel_role_sid The default_channel_role_sid
          # @param [String] default_channel_creator_role_sid The
          #   default_channel_creator_role_sid
          # @param [Boolean] read_status_enabled The read_status_enabled
          # @param [String] typing_indicator_timeout The typing_indicator_timeout
          # @param [String] consumption_report_interval The consumption_report_interval
          # @param [Hash] webhooks The webhooks
          # @return [ServiceInstance] Updated ServiceInstance
          def update(friendly_name: nil, default_service_role_sid: nil, default_channel_role_sid: nil, default_channel_creator_role_sid: nil, read_status_enabled: nil, typing_indicator_timeout: nil, consumption_report_interval: nil, webhooks: nil)
            context.update(
                friendly_name: friendly_name,
                default_service_role_sid: default_service_role_sid,
                default_channel_role_sid: default_channel_role_sid,
                default_channel_creator_role_sid: default_channel_creator_role_sid,
                read_status_enabled: read_status_enabled,
                typing_indicator_timeout: typing_indicator_timeout,
                consumption_report_interval: consumption_report_interval,
                webhooks: webhooks,
            )
          end
          
          ##
          # Access the channels
          # @return [channels] channels
          def channels
            context.channels
          end
          
          ##
          # Access the roles
          # @return [roles] roles
          def roles
            context.roles
          end
          
          ##
          # Access the users
          # @return [users] users
          def users
            context.users
          end
          
          ##
          # Provide a user friendly representation
          def to_s
            values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
            "<Twilio.IpMessaging.V1.ServiceInstance #{values}>"
          end
        end
      end
    end
  end
end