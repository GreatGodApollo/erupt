module Erupt
    # :nodoc:
    class LogTypes
        # List of all current log types
        ALLTYPES = %w(await complete debug error fatal fav info pause pending star start success wait warn watch)
        
        # Messages for log types
        MESSAGES = {
            "await"    => "AWAIT #{Emoji.emojize(":clock3:")} :",
            "complete" => "COMPLETE #{Emoji.emojize(":heavy_check_mark:")}:",
            "debug"    => "DEBUG #{Emoji.emojize(":black_circle:")}:",
            "error"    => "ERROR #{Emoji.emojize(":x:")}:",
            "fatal"    => "FATAL #{Emoji.emojize(":x:")}:",
            "fav"      => "FAV #{Emoji.emojize(":heart:")}:",
            "info"     => "INFO #{Emoji.emojize(":information_source:")}:",
            "pause"    => "PAUSE #{Emoji.emojize(":black_large_square:")}:",
            "pending"  => "PENDING #{Emoji.emojize(":black_large_square:")}:",
            "star"     => "STAR #{Emoji.emojize(":star:")}:",
            "start"    => "START #{Emoji.emojize(":arrow_forward:")}:",
            "success"  => "SUCCESS #{Emoji.emojize(":heavy_check_mark:")}:",
            "wait"     => "WAIT #{Emoji.emojize(":clock3:")} :",
            "warn"     => "WARN #{Emoji.emojize(":warning:")}:",
            "watch"    => "WATCH #{Emoji.emojize(":clock3:")} :"
        } of String => String

        # Colors for log types
        COLORS = {
            "await"     => :blue,
            "complete"  => :cyan,
            "debug"     => :red,
            "error"     => :red,
            "fatal"     => :red,
            "fav"       => :magenta,
            "info"      => :blue,
            "pause"     => :yellow,
            "pending"   => :magenta,
            "star"      => :yellow,
            "start"     => :green,
            "success"   => :green,
            "wait"      => :blue,
            "warn"      => :yellow,
            "watch"     => :yellow
        } of String => Symbol

        # List of severities for log types
        LOGTYPES = {
            "await"     => Logger::INFO,
            "complete"  => Logger::INFO,
            "debug"     => Logger::DEBUG,
            "error"     => Logger::ERROR,
            "fatal"     => Logger::ERROR,
            "fav"       => Logger::INFO,
            "info"      => Logger::INFO,
            "pause"     => Logger::INFO,
            "pending"   => Logger::INFO,
            "star"      => Logger::INFO,
            "start"     => Logger::INFO,
            "success"   => Logger::INFO,
            "wait"      => Logger::INFO,
            "warn"      => Logger::WARN,
            "watch"     => Logger::INFO
        } of String => Logger::Severity
    
        def self.getMessage(name : String)
            return MESSAGES[name]
        end
    end
end