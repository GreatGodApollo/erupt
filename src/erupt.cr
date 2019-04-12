require "logger"
require "chalk_box"
require "emoji"

# TODO: Write documentation for Erupt
module Erupt
  extend ChalkBox
  extend self
  VERSION = "0.1.0"

  class Erupt
    @@chalk = ChalkBox::Base.new
    @@emoji = Emoji

    @log_format = Logger::Formatter.new do |severity, datetime, progname, message, io|
      label = severity.unknown? ? "ANY" : severity.to_s
      io << @@chalk.gray("[" + datetime.to_s("%m/%d/%y %k:%M:%S") + "] ")
      io << message
    end

    def initialize(target : IO?, level : Logger::Severity)
      @log = Logger.new(target, level: level, formatter: @log_format)
      return self
    end

    def await(message)
      @log.info(@@chalk.bold.blue("AWAIT: #{@@emoji.emojize(":clock3:")} #{message}"))
    end

    def complete(message)
      @log.info(@@chalk.bold.cyan("COMPLETE: #{@@emoji.emojize(":ballot_box_with_check:")} #{message}"))
    end

    def error(message)
      @log.error(@@chalk.bold.red("ERROR: #{@@emoji.emojize(":x:")} #{message}"))
    end

    def debug(message)
      @log.debug(@@chalk.bold.red("DEBUG: #{@@emoji.emojize(":black_circle:")} #{message}"))
    end

    def fatal(message)
      @log.error(@@chalk.bold.red("FATAL: #{@@emoji.emojize(":x:")} #{message}"))
    end

    def fav(message)
      @log.info(@@chalk.bold.magenta("FAV: #{@@emoji.emojize(":heart:")} #{message}"))
    end

    def info(message)
      @log.info(@@chalk.bold.blue("INFO: #{@@emoji.emojize(":information_source:")} #{message}"))
    end

    def pause(message)
      @log.info(@@chalk.bold.yellow("PAUSE: ⏹️ #{message}"))
    end

    def pending(message)
      @log.info(@@chalk.bold.magenta("PENDING: ☐ #{message}"))
    end

    def star(message)
      @log.info(@@chalk.bold.yellow("STAR: #{@@emoji.emojize(":star:")} #{message}"))
    end

    def start(message)
      @log.info(@@chalk.bold.green("START: #{@@emoji.emojize(":arrow_forward:")} #{message}"))
    end

    def success(message)
      @log.info(@@chalk.bold.green("SUCCESS: #{@@emoji.emojize(":heavy_check_mark:")} #{message}"))
    end

    def wait(message)
      @log.info(@@chalk.bold.blue("WAIT: #{@@emoji.emojize(":clock3:")} #{message}"))
    end

    def warn(message)
      @log.warn(@@chalk.bold.yellow("WARN: #{@@emoji.emojize(":warning:")} #{message}"))
    end

    def watch(message)
      @log.info(@@chalk.bold.yellow("WATCH: #{@@emoji.emojize(":clock3:")} #{message}"))
    end
  end
end
