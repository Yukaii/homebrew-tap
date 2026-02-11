class Tsm < Formula
  desc "Tmux helper for sessions, worktrees, popup, and persistent panels"
  homepage "https://github.com/Yukaii/tsm"
  url "https://github.com/Yukaii/tsm/releases/download/v0.1.4/tsm-v0.1.4.tar.gz"
  sha256 "aec51e3c808f9fca9d0af01ea729b2afaa672d2396231de1c4f9011724de3d32"
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
