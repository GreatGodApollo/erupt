require "../src/erupt"

# Create a new Erupt with STDOUT as the output, DEBUG as the log level, and Erupt as the program name
erupt = Erupt::Erupt.new(STDOUT, Logger::DEBUG, "Erupt")

# Examples of all log types
erupt.await("Awaiting Something")
erupt.complete("Completed Something")
erupt.error("Erroring Something")
erupt.debug("Debugging Something")
erupt.fatal("Fatality!")
erupt.fav("This is my favorite")
erupt.info("Let's get some info")
erupt.pause("Pausing here")
erupt.pending("Waiting for that tick")
erupt.star("The star is born")
erupt.start("Starting a big process")
erupt.success("I succeeded at life!")
erupt.wait("Waiting for that thing")
erupt.warn("Warning about an issue")
erupt.watch("Watching for something")
