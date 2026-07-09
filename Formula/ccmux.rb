class Ccmux < Formula
  desc "Monitor AI coding agent sessions running in tmux"
  homepage "https://github.com/Yukaii/ccmux"
  version "1.1.0"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.0/ccmux-macos-arm64"
      sha256 "899a26f93e0e84991217f5e4e534d555b5838a0c493eaffd81a77c8be0f696f3"
    else
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.0/ccmux-macos-x64"
      sha256 "f65566805318a4eaf8133fca5952e8c446354931befd267bc9b7b9e452ee43d8"
    end
  end

  on_linux do
    url "https://github.com/Yukaii/ccmux/releases/download/v1.1.0/ccmux-linux-x64"
    sha256 "01b78fb662d0b01e7c3dc1e714ebba100d44c933c02bf0fd5de9410136691719"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "ccmux"
  end

  test do
    system "#{bin}/ccmux", "--version"
  end
end
