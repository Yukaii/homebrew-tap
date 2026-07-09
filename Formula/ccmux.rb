class Ccmux < Formula
  desc "Monitor AI coding agent sessions running in tmux"
  homepage "https://github.com/Yukaii/ccmux"
  version "1.1.2"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.2/ccmux-macos-arm64"
      sha256 "a559c346b0a6bbf1b2b07ae4fdad9bde518a7a980293f10f65c8f46e71693242"
    else
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.2/ccmux-macos-x64"
      sha256 "0965ac9f992ff7d180b57fef0d27009fb3d5d2e6fb1d26fba604ba09d075960b"
    end
  end

  on_linux do
    url "https://github.com/Yukaii/ccmux/releases/download/v1.1.2/ccmux-linux-x64"
    sha256 "8d57d552e168119319885818e0bccd311d27ff29de1a296cb031d2d32d877333"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "ccmux"
  end

  test do
    system "#{bin}/ccmux", "--version"
  end
end
