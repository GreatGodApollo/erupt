require "../src/erupt"

# Opens a log file
logfile = File.new("example.log", mode: "a")

# Defines logfile as the IO, DEBUG as the logger level, Erupt as the program name, and color as disabled
erupt = Erupt::Erupt.new(logfile, Logger::DEBUG, "Erupt", false)

# Marks start of the program
erupt.start("Started Erupt Example")

# Waits, designating some code running
sleep 1

# Could be a warning in middle of program
erupt.warn("I am warning you!!")

# Marks end of the program
erupt.complete("Completed Erupt Example")
