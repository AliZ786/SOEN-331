
%%  CONCORDIA UNIVERSITY
%%  Department of Computer Science and Software Engineering
%%  SOEN 331 Section S:  Assignment 3
%%  Fall 2022
%%  Date of submission: November 21, 2022
%%
%%  Authors:
%%
%%  Mohammad Ali Zahir - ID: 40077619 & Marwa Khalid - ID: 40155098



% Facts 

state(idle, null, null, null).
state(active, null, null, null).
state(configuring, 'Displays configuring mode', 'Proper threshold values are inputted', null).
state(reading, 'Flash red LED', 'Turn off LED', null).
state(emergency, 'Produces siren sound', 'Exits emergency mode', null).
state(exit, 'From idle, system exits', 'System shuts off', null).

initial(active).
final(exit).

transition(active, configuring, configure, 'Want to set threshold values', 'Displays configuring mode').
transition(active, reading, skip-configure, 'Skip setting threshold values', 'Perform series of beeps').
transition(active, idle, idle, null, 'System becomes idle').
transition(configuring, reading, finish-configuring, 'Proper threshold values are met', 'Perform series of beeps').
transition(reading, emergency,values-above-threshold , 'If CO_value or Temp_Value > threshold_value', 'System will enter emergency mode').
transition(reading, configuring ,reset-threshold , 'Set new threshold values', 'LED lights will shut off').
transition(emergency, reading ,reset-button-press , 'Stop siren sound', 'Exit emergency mode').
transition(idle, active ,active , null, 'System enters active mode').
transition(idle, exit ,exit , null, 'System shuts off').



% --------- Questions ----------

% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.



events(State1) :-
    findall([Event],
            transition(State1,_,Event, _, _), 
            EventList), write(EventList).


% (b) Create a rule that succeeds by collecting all system actions into a list and returns
% such list.

actions(State1) :-
    findall([Action],
            transition(State1,_,_,_,Action),
            ActionList), write(ActionList).


%(c) Create a rule that for a given pair of source-destination states, the rule succeeds
% by returning a list of criteria under which the system can perform a transition
% from the source to the destination. The criteria are defined as event-guard
% pairs.

event_guard_pairs(State1, State2) :-
    findall([Event, Guard],
            (transition(State1, State2,Event,Guard , _), State1 \== State2),
            List), write(List). 

% (d) Create a rule that succeeds by returning a list of source-destination state pairs,
% not taking into consideration any recursive or internal transitions.

source_destination_pairs(List) :-
 		findall([State1, State2],
            (transition(State1, State2,_,_ , _), State1 \== State2),
            List),
    		write(List). 
