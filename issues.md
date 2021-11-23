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


