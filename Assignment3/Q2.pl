% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.

state(idle, null, null, null).
state(active, null, null, null).
state(configuring, 'Displays configuring mode', 'Proper threshold values are inputted', null).
state(reading, 'Flash red LED', 'Turn off LED', null).
state(emergency, 'Produces siren sound', 'Exits emergency mode', null).

initial(active).
final(idle).

transition(active, configuring, configure, null, 'Displays configuring mode').
transition(active, reading, skip-configure, null, 'Perform series of beeps').
transition(active, idle, idle, null, 'On idle, system can shut down').
transition(configuring, reading, finish-configuring, null, 'Proper threshold values met, perform series of beeps').
transition(reading, emergency,values-above-threshold , null, 'System will enter emergency mode').
transition(reading, configuring ,reset-threshold , null, 'LED lights will shut off').
transition(emergency, reading ,reset-button-press , null, 'Exit emergency mode/shut off siren').




events(State1) :-
    findall([Event],
            transition(State1,_,Event, _, _), 
            EventList), write(EventList).