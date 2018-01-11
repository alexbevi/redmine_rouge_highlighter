module CodeRayWithFallback
  require 'coderay'
  require 'rouge'

  # Customized formatter based on Rouge::Formatters::HTMLLinewise
  # Syntax highlighting is completed within each line.
  class CustomHTMLLinewise < ::Rouge::Formatter
    def initialize(formatter)
      @formatter = formatter
    end
    def stream(tokens, &b)
      token_lines(tokens) do |line|
        line.each do |tok, val|
          yield @formatter.span(tok, val)
        end
        yield "\n"
      end
    end
  end

  def self.retrieve_supported_languages
    ::CodeRay::Scanners.list +
    # Add CodeRay scanner aliases
    ::CodeRay::Scanners.plugin_hash.keys.map(&:to_sym) -
    # Remove internal CodeRay scanners
    %w(debug default raydebug scanner).map(&:to_sym)
  end
  private_class_method :retrieve_supported_languages

  SUPPORTED_LANGUAGES = retrieve_supported_languages

  class << self
    # Highlights +text+ as the content of +filename+
    # Should not return line numbers nor outer pre tag
    def highlight_by_filename(text, filename)
      language = ::CodeRay::FileType[filename]
      if language
        ::CodeRay.scan(text, language).html(:break_lines => true)
      else
        # Fallback to Rouge if CodeRay does not the filename
        lexer = ::Rouge::Lexer.guess_by_filename(filename)
        html_formatter = ::Rouge::Formatters::HTML.new
        ::Rouge.highlight(text, lexer, CustomHTMLLinewise.new(html_formatter))
      end
    end

    # Highlights +text+ using +language+ syntax
    # Should not return outer pre tag
    def highlight_by_language(text, language)
      scanner = ::CodeRay.scanner(language)
      if scanner.lang != :text
        scanner.tokenize(text).html(:wrap => :span)
      else
        # Fallback to Rouge if CodeRay does not support the language
        lexer = ::Rouge::Lexer.find(language.downcase) || ::Rouge::Lexers::PlainText
        ::Rouge.highlight(text, lexer, ::Rouge::Formatters::HTML)
      end
    end

    def language_supported?(language)
      SUPPORTED_LANGUAGES.include?(language.to_s.downcase.to_sym)
    rescue
      false
    end
  end
end