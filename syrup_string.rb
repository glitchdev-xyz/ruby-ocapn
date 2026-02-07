class SyrupString
  attr_reader :encoded, :decoded
  SEPARATOR = '"'.freeze

  def initialize(string)
    @encoded = EncodedString.new(string)
    @decoded = DecodedString.new(@encoded)
  end

  def octets
    @octets ||= @decoded.octets
  end

  def message
    @message ||= @decoded.message
  end

  # def decoded(encoded)
  #   if encoded.is_a?(EncodedString)
  #     encoded_string.split(separator)
  #   end
  # end
end

class EncodedString
  attr_reader :content

  def initialize(string)
    octets = string.bytesize.to_s
    @content = "#{octets}#{SyrupString::SEPARATOR}#{string}"
  end
end

class DecodedString
  attr_reader :octets, :message

  def initialize(encoded_string)
    @octets_as_string, @message = encoded_string.content.split(SyrupString::SEPARATOR)
  end

  def octets
    @octets ||= @octets_as_string.to_i
  end
end
