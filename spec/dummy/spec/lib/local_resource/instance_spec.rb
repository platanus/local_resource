require "rails_helper"

RSpec.describe LocalResource::Instance do
  let(:file) { fixture_file_upload("image.png", "image/png") }
  let(:file_name) { "my-file.png" }
  let(:url) { "http://someurl/file.png" }

  subject { described_class.new(url, file_name) }

  before do
    allow_any_instance_of(described_class).to receive(:load_downloaded_data).and_return(file.read)
  end

  describe "#file" do
    it "returns a temp file" do
      expect(subject.file.class).to be(Tempfile)
    end

    it "returns same file calling method twice" do
      expect(subject.file).to eq(subject.file)
    end
  end

  describe "#file_path" do
    it "returns valid temp file" do
      expect(subject.file_path).to match(%{tmp\/local_resources\/my-file.+png})
    end
  end

  describe "#destroy" do
    it "deletes tmp file" do
      path = subject.file_path
      expect { subject.destroy }.to change { File.exist?(path) }.from(true).to(false)
    end

    it "creates new file instance" do
      file = subject.file
      subject.destroy
      expect(file).to_not eq(subject.file)
    end
  end
end
