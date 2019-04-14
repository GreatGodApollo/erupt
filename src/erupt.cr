require "logger"
require "chalk_box"
require "emoji"
require "./logtypes"

# TODO: Write documentation for Erupt
module Erupt
  VERSION = "0.2.0"
  CHALK = ChalkBox::Base.new

  class Erupt

    def initialize(target : IO?, level : Logger::Severity, programname : String = "")
      @chalk = ChalkBox::Base.new
      @log_format = Logger::Formatter.new do |severity, datetime, progname, message, io|
        if progname.size > 0
          io << @chalk.bold.black("[#{progname}] ")
        end
        io << @chalk.gray("[" + datetime.to_s("%m/%d/%y %k:%M:%S") + "] ➡ ️")
        io << message
      end
      @log = Logger.new(target, level: level, formatter: @log_format, progname: programname)
    end

    macro define_logger(name)
      def {{name.id}}(message)
        {% if LogTypes::LOGTYPES[name].resolve == Logger::INFO %}
          @log.info("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::DEBUG %}
          @log.debug("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::WARN %}
          @log.warn("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::ERROR %}
          @log.error("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
        {% end %}
      end
    end

    {% for logger in LogTypes::ALLTYPES %}
      define_logger({{logger}})
    {% end %}
  end
end
