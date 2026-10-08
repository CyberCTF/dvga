#!/bin/sh
# The GraphQL endpoint answers a query on the seeded pastes: the vulnerable API is up with its data.
curl -fsS -H 'Content-Type: application/json' -d '{"query":"{ pastes { id title } }"}' \
  http://dvga:5013/graphql | grep -q '"title"'
