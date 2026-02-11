class Tsm < Formula
  desc "Tmux helper for sessions, worktrees, popup, and persistent panels"
  homepage "https://github.com/Yukaii/tsm"
  url "https://github.com/Yukaii/tsm/releases/download/v0.2.0/tsm-v0.2.0.tar.gz"
  sha256 "14e2159bc8a82f2a709afe5a4ad324d9821661956f20c8cca7eb3b00b6df95ed"
  license "MIT"
  head "https://github.com/Yukaii/tsm.git", branch: "main"

  depends_on "fzf"
  depends_on "tmux"

  def install
    bin.install "tsm"
  end

  test do
    assert_match "Usage: tsm", shell_output("#{bin}/tsm help")
  end
end
