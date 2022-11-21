% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.

state(idle, null, null, null).
state(active, null, null, null).
state(configuring, 'Displays configuring mode', 'Proper threshold values are inputted', null).
state(reading, 'Flash red LED', 'Turn off LED', null).
state(emergency, 'Produces siren sound', 'Exits emergency mode', null).
state(exit, 'From idle, system exits', 'System shuts off', null).

initial(active).
final(exit).

transition(active, configuring, configure, null, 'Displays configuring mode').
transition(active, reading, skip-configure, null, 'Perform series of beeps').
transition(active, idle, idle, null, 'System becomes idle').
transition(configuring, reading, finish-configuring, null, 'Proper threshold values met, perform series of beeps').
transition(reading, emergency,values-above-threshold , null, 'System will enter emergency mode').
transition(reading, configuring ,reset-threshold , null, 'LED lights will shut off').
transition(emergency, reading ,reset-button-press , null, 'Exit emergency mode/shut off siren').
transition(idle, active ,active , null, 'System enters active mode').
transition(idle, exit ,exit , null, 'System shuts off').




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


