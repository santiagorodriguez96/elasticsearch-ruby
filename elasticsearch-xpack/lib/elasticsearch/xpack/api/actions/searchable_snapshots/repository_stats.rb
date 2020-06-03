# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

module Elasticsearch
  module XPack
    module API
      module SearchableSnapshots
        module Actions
          # Retrieve usage statistics about a snapshot repository.
          #
          # @option arguments [String] :repository The repository for which to get the stats for
          # @option arguments [Hash] :headers Custom HTTP headers
          #
          # @see https://www.elastic.co/guide/en/elasticsearch/reference/master/searchable-snapshots-repository-stats.html
          #
          def repository_stats(arguments = {})
            raise ArgumentError, "Required argument 'repository' missing" unless arguments[:repository]

            headers = arguments.delete(:headers) || {}

            arguments = arguments.clone

            _repository = arguments.delete(:repository)

            method = Elasticsearch::API::HTTP_GET
            path   = "_snapshot/#{Elasticsearch::API::Utils.__listify(_repository)}/_stats"
            params = {}

            body = nil
            perform_request(method, path, params, body, headers).body
          end
        end
      end
    end
  end
end