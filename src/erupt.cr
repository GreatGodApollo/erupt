require "logger"
require "chalk_box"
require "emoji"
require "./logtypes"

# TODO: Write documentation for Erupt
module Erupt
  VERSION = "0.4.0"
  # :nodoc:
  CHALK = ChalkBox::Base.new

  class Erupt
    def initialize(target : IO?, level : Logger::Severity, program_name : String = "", @color_enabled : Bool = true)
      @chalk = ChalkBox::Base.new
      @log_format = Logger::Formatter.new do |severity, datetime, progname, message, io|
        if @color_enabled
          if progname.size > 0
            io << @chalk.bold.black("[#{progname}] ")
          end
          io << @chalk.gray("[" + datetime.to_s("%m/%d/%y %k:%M:%S") + "] ➡ ️")
        else
          if progname.size > 0
            io << "[#{progname}] "
          end
          io << "[" + datetime.to_s("%m/%d/%y %k:%M:%S") + "] ➡ ️"
        end
        io << message
      end
      @log = Logger.new(target, level: level, formatter: @log_format, progname: program_name)
    end

    private macro define_logger(name)
      def {{name.id}}(message)
        {% if LogTypes::LOGTYPES[name].resolve == Logger::INFO %}
          if @color_enabled
            @log.info("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
          else
            @log.info("#{(LogTypes.getMessage({{name}}))} #{message}")
          end
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::DEBUG %}
          if @color_enabled
            @log.debug("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
          else
            @log.debug("#{(LogTypes.getMessage({{name}}))} #{message}")
          end
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::WARN %}
          if @color_enabled
            @log.warn("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
          else
            @log.warn("#{(LogTypes.getMessage({{name}}))} #{message}")
          end
        {% elsif LogTypes::LOGTYPES[name].resolve == Logger::ERROR %}
          if @color_enabled
            @log.error("#{CHALK.bold.{{LogTypes::COLORS[name].id}}("#{(LogTypes.getMessage({{name}}))}")} #{message}")
          else
            @log.error("#{(LogTypes.getMessage({{name}}))} #{message}")
          end
        {% end %}
      end
    end

    {% for logger in LogTypes::ALLTYPES %}
      define_logger({{logger}})
    {% end %}
  end
end
