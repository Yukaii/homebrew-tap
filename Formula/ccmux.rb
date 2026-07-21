class Ccmux < Formula
  desc "Monitor AI coding agent sessions running in tmux"
  homepage "https://github.com/Yukaii/ccmux"
  version "1.2.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yukaii/ccmux/releases/download/v1.2.1/ccmux-macos-arm64"
      sha256 "3d3b8b600b94ae8f3b425816b0dd744b84bdf0feb366fc3fc31b208c198c76b0"
    else
      url "https://github.com/Yukaii/ccmux/releases/download/v1.2.1/ccmux-macos-x64"
      sha256 "7d5de2c17e9d3e5aeeda5cd76fc9710acde7b5fb67bb15dd959e5df42b405e9f"
    end
  end

  on_linux do
    url "https://github.com/Yukaii/ccmux/releases/download/v1.2.1/ccmux-linux-x64"
    sha256 "899ec90c51e6d7e9880cb20db8cfa0debc9d47b0125829ffc58697ecc1ff19ed"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "ccmux"
  end

  test do
    system "#{bin}/ccmux", "--version"
  end
end
