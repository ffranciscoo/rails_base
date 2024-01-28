require 'swagger_helper'

RSpec.describe 'api/v1/ping', type: :request do
  # --[ping]--------------------------------------------------------------------
  # This is a ping endpoint to check if the server is up (useful for load balancers)
  path '/api/v1/ping' do
    get 'Ping' do
      tags 'Ping'
      produces 'application/json'

      response '200', 'pong' do
        schema type: :object,
               properties: {
                 message: { type: :string }
               },
               required: ['message']

        run_test!
      end
    end
  end
end
