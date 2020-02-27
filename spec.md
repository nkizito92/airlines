Specifications for the Rails Assessment
Specs:

 Using Ruby on Rails for the project
 Include at least one has_many relationship (x has_many y; e.g. User has_many Passengers)
 Include at least one belongs_to relationship (x belongs_to y; e.g. Passenger belongs_to User)
 Include at least two has_many through relationships (x has_many y through z; e.g. Passenger has_many Flights through Tickets)
 Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Passenger has_many Flights through Tickets, Flight has_many Passengers through Tickets)
 The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
 Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Passenger, flight, ticket)
 Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. Ticket.cheapest URL: airlines/1/flights/1/tickets)
 Include signup (how e.g. Devise)
 Include login (how e.g. Devise)
 Include logout (how e.g. Devise)
 Include third party signup/login (how e.g. Devise/OmniAuth)
 Include nested resource show or index (URL e.g. airlines/1/flights)
 Include nested resource "new" form (URL e.g. flights/1/tickets/new)
 Include form display of validation errors (form URL e.g. /passengers/new, /tickets/new, or /flight/1/tickets/1/buy)
Confirm:

 The application is pretty DRY
 Limited logic in controllers
 Views use helper methods if appropriate
 Views use partials if appropriate