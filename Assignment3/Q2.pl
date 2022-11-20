% a) What events, if any, are legal while the system is at any given mode, e.g. while
% being active? Create a rule that succeeds by encapsulating any such events into
% a list, and returns the list.


state(configuring, 'Displays configuring mode', 'Enters reading mode', null)
state(reading, 'Flashes red LED', 'Switches off LED', null )
state(emergency, 'Produce siren sound', 'Displays exit emergency', reading)