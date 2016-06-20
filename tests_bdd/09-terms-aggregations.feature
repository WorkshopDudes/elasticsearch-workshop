Feature: Aggregations

  # Use https://www.elastic.co/guide/en/elasticsearch/reference/current/search-aggregations-bucket-terms-aggregation.html

  # Note that "aggs" should be on the same level as "query" and not inside a query, like this:
  # {
  #   "query" : {
  #      ...
  #   },
  #   "aggs" : {
  #      ...
  #    }
  # }
  # For this task you only need the "aggs".

  # Note that aggregations appear at the bottom of the response from Elasticsearch. If you
  # are using the Sense extension for Chrome, you may have to scroll down to the bottom of
  # the response window to see them.

  Scenario: For every topping, count the number of pizzas containing that topping
    Given all pizzas are indexed
    When I make a query
    """
    { todo }
    """
    Then the response should contain
    """
    {
      "aggregations":{
        "toppings":{
          "buckets":[
            {
              "key":"Bacon",
              "doc_count":2
            },
            {
              "key":"Ham",
              "doc_count":2
            },
            {
              "key":"Meatballs",
              "doc_count":2
            },
            {
              "key":"Beef",
              "doc_count":1
            },
            {
              "key":"Chorizo",
              "doc_count":1
            },
            {
              "key":"Marinated Beef",
              "doc_count":1
            },
            {
              "key":"Marinated Chicken",
              "doc_count":1
            },
            {
              "key":"Pepperoni",
              "doc_count":1
            }
          ]
        }
      }
    }
    """