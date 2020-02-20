# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    hobby = Airline.create(name: "Hobby Airport", address: "100 main st. 78670", destination: "Austin Airport")
    ohio = Airline.create(name: "Ohio Airport", address: "1040 ohio st. 35495", destination: "Austin Airport")

    austin_tic = Ticket.new(ticket_num: "$44654", seat_num: 3, price: 60)
    houston_tic = Ticket.new(ticket_num: "$444", seat_num: 8, price: 100)
    h_round_trip = Ticket.new(ticket_num: "$445687", seat_num: 4, price: 300)
    round_trip = Ticket.new(ticket_num: "$445AA7", seat_num: 5, price: 300)
    round_tripB = Ticket.new(ticket_num: "$4457", seat_num: 4, price: 300)
    
    jone = Passenger.create(full_name: "Jone James", age: 15)

    flight_h = Flight.new(title: "flightA", departure: "10:45AM", arrival: "11:25AM")
    flight_h2 = Flight.new(title: "flightB", departure: "12:45AM", arrival: "2:25PM")
    flight_o1 = Flight.new(title: "flight O1", departure: "10:45AM", arrival: "3:25PM")
    flight_o2 = Flight.new(title: "flight O2", departure: "10:45AM", arrival: "2:25PM")
    # connecting tickets to flights 
    austin_tic.flight = flight_h 
    houston_tic.flight = flight_h2
    h_round_trip.flight = flight_o1

    flight_o1.tickets << round_trip 
    flight_o1.tickets << round_tripB
    # one tickect has a passenger
    austin_tic.passenger = jone 
    austin_tic.save
    
    flight_h.airline = hobby 
    flight_h.save
    flight_o1.airline = ohio
    flight_o2.airline = ohio
    flight_o1.save
    flight_o2.save