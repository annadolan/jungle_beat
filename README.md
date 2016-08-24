#Jungle Beats
This project is an implementation of a linked list in Ruby to make a simple drum machine. It creates a linked list that can be built on by appending, prepending, and inserting nodes into the list.
There are additional functions for:
* Counting the number of nodes in the linked list
* Returning the nodes' data as a string
* Finding and returning the data from a node or group of nodes by giving the location and desired number of nodes to return
* Checking the list to see if it includes a node with the given data

The final goal of the project is for the computer to "say" the data that is stored in the linked list's nodes. The method named "play" turns the data into a string and tells the computer to say it.

##Extensions completed:
1. Before the program appends, prepends, or inserts, it checks the given data against a list of allowed "sounds." If the data given is not allowed, it is not added to the list.
2. The program has the default rate for the "play" method set as 500, and the default voice is set as "Boing." Both values can be set by the user, however, by stating "rate = fixnum" or "voice = 'string'". Both can be reset to their default values by calling the reset_rate and reset_voice methods.
