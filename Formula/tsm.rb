class Tsm < Formula
  desc "Tmux helper for sessions, worktrees, popup, and persistent panels"
  homepage "https://github.com/Yukaii/tsm"
  url "https://github.com/Yukaii/tsm/releases/download/v0.2.1/tsm-v0.2.1.tar.gz"
  sha256 "3587941db0c863df941f8d3f3e0e461a4a92ce8b380b0f2ef1e925562b6ef768"
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
