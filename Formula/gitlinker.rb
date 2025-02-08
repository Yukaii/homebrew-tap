class Gitlinker < Formula
  homepage "https://github.com/Yukaii/gitlinker.cr"
  head "https://github.com/Yukaii/gitlinker.cr.git", branch: "main"
  license "MIT"

  depends_on "crystal"

  def install
    system "shards", "build", "--production", "--release", "--no-debug"
    bin.install "./bin/gitlinker"
  end

  test do
    system "#{bin}/gitlinker", "--version"
  end
end
