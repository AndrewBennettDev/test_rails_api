class ApiController < ApplicationController
    def get_data
        @data = {
          'message' => 'This is a sample API endpoint',
          'timestamp' => Time.now
        }
    
        respond_to do |format|
          format.html
          format.json { render json: @data }

      format.turbo_stream do
        turbo_stream.append(
          'api-data',
          partial: 'api/get_data',
          locals: { data: @data }
        )
            end
        end
    end
end
