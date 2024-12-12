class DsStoreParser < Formula
  desc ".DS_Store parser implemented in Go"
  homepage "https://github.com/Yukaii/ds-store-parser"
  head "https://github.com/Yukaii/ds-store-parser.git", branch: "main"
  license "MIT"

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args, "."
  end

  test do
    # A simple test that checks if running the tool without arguments
    # produces output mentioning ".DS_Store"
    output = shell_output("#{bin}/ds-store-parser")
    assert_match ".DS_Store", output
  end
end
