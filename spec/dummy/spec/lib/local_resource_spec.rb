require "rails_helper"

RSpec.describe LocalResource do
  let(:tmp_filename) { double }
  let(:url) { double }
  let(:file_path) { double }
  let(:instance) { double(file_path: file_path, destroy: true) }

  describe "#as_local_resource" do
    def perform
      described_class.as_local_resource(url, tmp_filename, &action)
    end

    let(:action) do
      Proc.new do |_path|
        "result"
      end
    end

    before do
      expect(LocalResource::Instance).to receive(:new).with(url, tmp_filename).and_return(instance)
      expect(action).to receive(:call).with(file_path).and_call_original
      expect(instance).to receive(:destroy)
    end

    it "calls action with the local resource" do
      expect(perform).to eq("result")
    end

    context "when action raises an error" do
      let(:action) do
        Proc.new do |_path|
          fail "error"
        end
      end

      it "calls destroy method anyway" do
        expect { perform }.to raise_error("error")
      end
    end
  end
end
