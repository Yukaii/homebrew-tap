class Tsm < Formula
  desc "Tmux helper for sessions, worktrees, popup, and persistent panels"
  homepage "https://github.com/Yukaii/tsm"
  url "https://github.com/Yukaii/tsm/releases/download/v0.1.3/tsm-v0.1.3.tar.gz"
  sha256 "1a1d34ab8d30e6e872ad55409ca62723c7ba0de8501b1cdfbb66659c3a932769"
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
