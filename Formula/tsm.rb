class Tsm < Formula
  desc "Tmux Session Manager"
  homepage "https://github.com/Yukaii/tsm"
  url "https://github.com/Yukaii/tsm/releases/download/v0.1.2/tsm-v0.1.2.tar.gz"
  sha256 "1aa4ffd7bd1cbfe90c10969ba9b437c54926aef6392203230d005785477ba0c8"
  license "MIT"

  def install
    bin.install "tsm"
  end

  test do
    system "#{bin}/tsm", "help"
  end
end
