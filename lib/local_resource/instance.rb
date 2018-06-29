require 'open-uri'
require 'open_uri_redirections'

module LocalResource
  class Instance
    def initialize(url, tmp_filename)
      @url = url
      @tmp_file_name = File.basename(tmp_filename, ".*")
      @tmp_file_ext = File.extname(tmp_filename)
    end

    def file
      @file ||= load_tempfile
    end

    def file_path
      file.path
    end

    def destroy
      return unless @file
      @file.delete
      @file = nil
    end

    def self.tmp_dir
      path = Rails.root.join('tmp/local_resources')
      FileUtils::mkdir_p(path.to_s).first
    end

    private

    def load_downloaded_data
      open(@url, allow_redirections: :all) do |io|
        return io.read
      end
    end

    def load_tempfile
      filename = [@tmp_file_name, @tmp_file_ext]
      data = load_downloaded_data

      Tempfile.new(filename, self.class.tmp_dir, encoding: data.encoding).tap do |f|
        f.write(data)
        f.close
      end
    end
  end
end
