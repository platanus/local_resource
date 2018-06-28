require "local_resource/engine"

module LocalResource
  extend self

  # You can add, in this module, your own configuration options as in the example below...
  #
  # attr_writer :my_option
  #
  # def my_option
  #   return "Default Value" unless @my_option
  #   @my_option
  # end
  #
  # Then, you can customize the default behaviour (typically in a Rails initializer) like this:
  #
  # LocalResource.setup do |config|
  #   config.root_url = "Another value"
  # end

  def setup
    yield self
    require "local_resource"
  end

  def as_local_resource(url, tmp_filename, &block)
    instance = LocalResource::Instance.new(url, tmp_filename)
    block.call(instance.file_path)
  ensure
    instance&.destroy
  end
end
