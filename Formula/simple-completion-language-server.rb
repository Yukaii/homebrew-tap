class SimpleCompletionLanguageServer < Formula
  desc "Allow to use common word completion and snippets for Helix editor"
  homepage "https://github.com/estin/simple-completion-language-server"
  head "https://github.com/estin/simple-completion-language-server.git", branch: "main"

  depends_on "rust" => :build

  def install
    system "cargo", "install", "--bin", "simple-completion-language-server", *std_cargo_args(path: ".")
  end

  test do
    system "#{bin}/simple-completion-language-server", "--help"
  end
end
