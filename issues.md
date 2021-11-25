# First Error

NameError: uninitialized constant Oystercard
filepath: ./spec/oystercard_spec.rb
line number: 1
solution: Define the class Oystercard within the lib folder.

# Irb plan

Plan for top_up testing

open irb 

create a new class instance of oystercard, card

on the new card call the method top_up in order to envoke the top up value and we would include a value as an argument.

We would hope the balance of the card would increase by that amount. (but it won't)

# Testing limit plan

Create a new class instance of Oystercard

top_up with 20 then top_up with 80

expect to raise an error

# Testing deduct method

Create a new class instance of Oystercard

top_up with 50.

call the method deduct on the new class instance.

hope to see a deduction of a certain value from the balance.

(This will fail)

# Touch-in and Touch-out plan

Create an instance of Oystercard

When we apply method touch_in, we expect in_journey? to be true.

When we apply method touch_out, we expect in_journey? to be false.

# Checking min balance on touch_in plan

Create an instance of Oystercard

Call the method touch_in immediately when the balance is 0. 

Expect this to raise an error for not having the min balance of £1.

# Charge on touch out plan

Create an instance of Oystercard

top_up Oystercard above the minimum balance

touch_in

touch_out

We expect the balance to reduce by the fare amount

# Saving entry station plan

Create an instance of Oystercard

top_up Oystercard above the minimum balance

Call touch_in with an argument entry station

Calling the method entry_station will return entry station

# Journey history plan 

Create an instance of oystercard

top up oystercard above min balance

call journey_history 

expect it to be empty

call touch_in with arg entry station

call touch_out with arg exit station

call journey_history 

expect to see a list of all prev journeys 

# Creating the Station class plan

Create an instance of the class Station

Call station.name and expect the name to be returned

Call station.zone and expect the zone to be returned

