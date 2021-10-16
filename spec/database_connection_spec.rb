require 'database_connection'

describe DatabaseConnection do
  describe ".connect" do
    it "should connect to database" do
      expect(PG).to receive(:connect).with(dbname: "chitter")
      described_class.connect("chitter")
    end
  end

  describe ".query" do
    it "should query database" do
      connection = described_class.connect("chitter")
      expect(connection).to receive(:exec_params).with("SELECT * FROM peeps;", [])
      described_class.query("SELECT * FROM peeps;", [])
    end
  end
end