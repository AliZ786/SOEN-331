% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.

state(idle).
state(active)
state(configuring).
state(reading).
state(emergency).

initial(active).
final(idle).

