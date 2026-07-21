class Ccmux < Formula
  desc "Monitor AI coding agent sessions running in tmux"
  homepage "https://github.com/Yukaii/ccmux"
  version "1.2.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yukaii/ccmux/releases/download/v1.2.0/ccmux-macos-arm64"
      sha256 "3c2ea7b775934216349c1e24fff02634124f83f9374e60fb1c8ea1af6c86d7df"
    else
      url "https://github.com/Yukaii/ccmux/releases/download/v1.2.0/ccmux-macos-x64"
      sha256 "0260a34802dca9ecacc7e61f16e2a47b426b6597e9ddda9b0e487f932edd2ed2"
    end
  end

  on_linux do
    url "https://github.com/Yukaii/ccmux/releases/download/v1.2.0/ccmux-linux-x64"
    sha256 "acf2334d122cc984a4dd91609e77370a676a82e845773c2b279f785efade3e17"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "ccmux"
  end

  test do
    system "#{bin}/ccmux", "--version"
  end
end
