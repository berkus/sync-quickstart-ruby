##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /       

module Twilio
  module REST
    class Taskrouter < Domain
      class V1 < Version
        class WorkspaceContext < InstanceContext
          class EventList < ListResource
            ##
            # Initialize the EventList
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The sid
            # @return [EventList] EventList
            def initialize(version, workspace_sid: nil)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Events"
            end
            
            ##
            # Lists EventInstance records from the API as a list.
            # Unlike stream(), this operation is eager and will load `limit` records into
            # memory before returning.
            # @param [Time] end_date The end_date
            # @param [String] event_type The event_type
            # @param [String] minutes The minutes
            # @param [String] reservation_sid The reservation_sid
            # @param [Time] start_date The start_date
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_sid The task_sid
            # @param [String] worker_sid The worker_sid
            # @param [String] workflow_sid The workflow_sid
            # @param [Integer] limit Upper limit for the number of records to return. stream()
            #                   guarantees to never return more than limit.  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when not set will                      use
            #  the default value of 50 records.  If no page_size is                      defined
            #  but a limit is defined, stream() will attempt to read                      the
            #  limit with the most efficient page size,                      i.e. min(limit, 1000)
            # @return [Array] Array of up to limit results
            def list(end_date: nil, event_type: nil, minutes: nil, reservation_sid: nil, start_date: nil, task_queue_sid: nil, task_sid: nil, worker_sid: nil, workflow_sid: nil, limit: nil, page_size: nil)
              self.stream(
                  end_date: end_date,
                  event_type: event_type,
                  minutes: minutes,
                  reservation_sid: reservation_sid,
                  start_date: start_date,
                  task_queue_sid: task_queue_sid,
                  task_sid: task_sid,
                  worker_sid: worker_sid,
                  workflow_sid: workflow_sid,
                  limit: limit,
                  page_size: page_size
              ).entries
            end
            
            ##
            # Streams EventInstance records from the API as an Enumerable.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] end_date The end_date
            # @param [String] event_type The event_type
            # @param [String] minutes The minutes
            # @param [String] reservation_sid The reservation_sid
            # @param [Time] start_date The start_date
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_sid The task_sid
            # @param [String] worker_sid The worker_sid
            # @param [String] workflow_sid The workflow_sid
            # @param [Integer] limit Upper limit for the number of records to return.                  stream()
            #  guarantees to never return more than limit.                  Default is no limit
            # @param [Integer] page_size Number of records to fetch per request, when                      not set will use
            #  the default value of 50 records.                      If no page_size is defined
            #                       but a limit is defined, stream() will attempt to                      read the
            #  limit with the most efficient page size,                       i.e. min(limit, 1000)
            # @return [Enumerable] Enumerable that will yield up to limit results
            def stream(end_date: nil, event_type: nil, minutes: nil, reservation_sid: nil, start_date: nil, task_queue_sid: nil, task_sid: nil, worker_sid: nil, workflow_sid: nil, limit: nil, page_size: nil)
              limits = @version.read_limits(limit, page_size)
              
              page = self.page(
                  end_date: end_date,
                  event_type: event_type,
                  minutes: minutes,
                  reservation_sid: reservation_sid,
                  start_date: start_date,
                  task_queue_sid: task_queue_sid,
                  task_sid: task_sid,
                  worker_sid: worker_sid,
                  workflow_sid: workflow_sid,
                  page_size: limits['page_size'],
              )
              
              @version.stream(page, limit: limits['limit'], page_limit: limits['page_limit'])
            end
            
            ##
            # When passed a block, yields EventInstance records from the API.
            # This operation lazily loads records as efficiently as possible until the limit
            # is reached.
            # @param [Time] end_date The end_date
            # @param [String] event_type The event_type
            # @param [String] minutes The minutes
            # @param [String] reservation_sid The reservation_sid
            # @param [Time] start_date The start_date
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_sid The task_sid
            # @param [String] worker_sid The worker_sid
            # @param [String] workflow_sid The workflow_sid
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
            # Retrieve a single page of EventInstance records from the API.
            # Request is executed immediately.
            # @param [Time] end_date The end_date
            # @param [String] event_type The event_type
            # @param [String] minutes The minutes
            # @param [String] reservation_sid The reservation_sid
            # @param [Time] start_date The start_date
            # @param [String] task_queue_sid The task_queue_sid
            # @param [String] task_sid The task_sid
            # @param [String] worker_sid The worker_sid
            # @param [String] workflow_sid The workflow_sid
            # @param [String] page_token PageToken provided by the API
            # @param [Integer] page_number Page Number, this value is simply for client state
            # @param [Integer] page_size Number of records to return, defaults to 50
            # @return [Page] Page of EventInstance
            def page(end_date: nil, event_type: nil, minutes: nil, reservation_sid: nil, start_date: nil, task_queue_sid: nil, task_sid: nil, worker_sid: nil, workflow_sid: nil, page_token: nil, page_number: nil, page_size: nil)
              params = {
                  'EndDate' => Twilio.serialize_iso8601(end_date),
                  'EventType' => event_type,
                  'Minutes' => minutes,
                  'ReservationSid' => reservation_sid,
                  'StartDate' => Twilio.serialize_iso8601(start_date),
                  'TaskQueueSid' => task_queue_sid,
                  'TaskSid' => task_sid,
                  'WorkerSid' => worker_sid,
                  'WorkflowSid' => workflow_sid,
                  'PageToken' => page_token,
                  'Page' => page_number,
                  'PageSize' => page_size,
              }
              response = @version.page(
                  'GET',
                  @uri,
                  params
              )
              return EventPage.new(@version, response, @solution)
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '#<Twilio.Taskrouter.V1.EventList>'
            end
          end
        
          class EventPage < Page
            ##
            # Initialize the EventPage
            # @param [Version] version Version that contains the resource
            # @param [Response] response Response from the API
            # @param [Hash] solution Path solution for the resource
            # @param [String] workspace_sid The sid
            # @return [EventPage] EventPage
            def initialize(version, response, solution)
              super(version, response)
              
              # Path Solution
              @solution = solution
            end
            
            ##
            # Build an instance of EventInstance
            # @param [Hash] payload Payload response from the API
            # @return [EventInstance] EventInstance
            def get_instance(payload)
              return EventInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              '<Twilio.Taskrouter.V1.EventPage>'
            end
          end
        
          class EventContext < InstanceContext
            ##
            # Initialize the EventContext
            # @param [Version] version Version that contains the resource
            # @param [String] workspace_sid The workspace_sid
            # @param [String] sid The sid
            # @return [EventContext] EventContext
            def initialize(version, workspace_sid, sid)
              super(version)
              
              # Path Solution
              @solution = {
                  workspace_sid: workspace_sid,
                  sid: sid,
              }
              @uri = "/Workspaces/#{@solution[:workspace_sid]}/Events/#{@solution[:sid]}"
            end
            
            ##
            # Fetch a EventInstance
            # @return [EventInstance] Fetched EventInstance
            def fetch
              params = {}
              
              payload = @version.fetch(
                  'GET',
                  @uri,
                  params,
              )
              
              return EventInstance.new(
                  @version,
                  payload,
                  workspace_sid: @solution[:workspace_sid],
                  sid: @solution[:sid],
              )
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              context = @solution.map {|k, v| "#{k}: #{v}"}.join(',')
              "#<Twilio.Taskrouter.V1.EventContext #{context}>"
            end
          end
        
          class EventInstance < InstanceResource
            ##
            # Initialize the EventInstance
            # @param [Version] version Version that contains the resource
            # @param [Hash] payload payload that contains response from Twilio
            # @param [String] workspace_sid The sid
            # @param [String] sid The sid
            # @return [EventInstance] EventInstance
            def initialize(version, payload, workspace_sid: nil, sid: nil)
              super(version)
              
              # Marshaled Properties
              @properties = {
                  'account_sid' => payload['account_sid'],
                  'actor_sid' => payload['actor_sid'],
                  'actor_type' => payload['actor_type'],
                  'actor_url' => payload['actor_url'],
                  'description' => payload['description'],
                  'event_data' => payload['event_data'],
                  'event_date' => Twilio.deserialize_iso8601(payload['event_date']),
                  'event_type' => payload['event_type'],
                  'resource_sid' => payload['resource_sid'],
                  'resource_type' => payload['resource_type'],
                  'resource_url' => payload['resource_url'],
                  'sid' => payload['sid'],
                  'source' => payload['source'],
                  'source_ip_address' => payload['source_ip_address'],
                  'url' => payload['url'],
              }
              
              # Context
              @instance_context = nil
              @params = {
                  'workspace_sid' => workspace_sid,
                  'sid' => sid || @properties['sid'],
              }
            end
            
            ##
            # Generate an instance context for the instance, the context is capable of
            # performing various actions.  All instance actions are proxied to the context
            # @param [Version] version Version that contains the resource
            # @return [EventContext] EventContext for this EventInstance
            def context
              unless @instance_context
                @instance_context = EventContext.new(
                    @version,
                    @params['workspace_sid'],
                    @params['sid'],
                )
              end
              @instance_context
            end
            
            def account_sid
              @properties['account_sid']
            end
            
            def actor_sid
              @properties['actor_sid']
            end
            
            def actor_type
              @properties['actor_type']
            end
            
            def actor_url
              @properties['actor_url']
            end
            
            def description
              @properties['description']
            end
            
            def event_data
              @properties['event_data']
            end
            
            def event_date
              @properties['event_date']
            end
            
            def event_type
              @properties['event_type']
            end
            
            def resource_sid
              @properties['resource_sid']
            end
            
            def resource_type
              @properties['resource_type']
            end
            
            def resource_url
              @properties['resource_url']
            end
            
            def sid
              @properties['sid']
            end
            
            def source
              @properties['source']
            end
            
            def source_ip_address
              @properties['source_ip_address']
            end
            
            def url
              @properties['url']
            end
            
            ##
            # Fetch a EventInstance
            # @return [EventInstance] Fetched EventInstance
            def fetch
              context.fetch
            end
            
            ##
            # Provide a user friendly representation
            def to_s
              values = @params.map{|k, v| "#{k}: #{v}"}.join(" ")
              "<Twilio.Taskrouter.V1.EventInstance #{values}>"
            end
          end
        end
      end
    end
  end
end