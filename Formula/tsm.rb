class Tsm < Formula
  desc "Tmux helper for sessions, worktrees, popup, and persistent panels"
  homepage "https://github.com/Yukaii/tsm"
  url "https://codeload.github.com/Yukaii/tsm/tar.gz/834972bde5cf385ac8b4241555d042736cf91de3"
  sha256 "38c05cab8123f73071e456c44ac6cce97736adf0c6be223badb9e007313c66db"
  license "MIT"
  head "https://github.com/Yukaii/tsm.git", branch: "main"

  depends_on "fzf"
  depends_on "tmux"

  def install
    system "bash", "./scripts/build.sh", "./tsm"
    bin.install "tsm"
  end

  test do
    assert_match "Usage: tsm", shell_output("#{bin}/tsm help")
  end
end
