% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.

state(idle, null, null, null).
state(active, null, null, null)
state(configuring, 'Displays configuring mode', 'Proper threshold values are inputted', null).
state(reading, 'Flash red LED', 'Turn off LED', null).
state(emergency, 'Produces siren sound', 'Exits emergency mode', null).

initial(active).
final(idle).

