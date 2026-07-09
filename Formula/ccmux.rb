class Ccmux < Formula
  desc "Monitor AI coding agent sessions running in tmux"
  homepage "https://github.com/Yukaii/ccmux"
  version "1.1.1"
  license "MIT"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.1/ccmux-macos-arm64"
      sha256 "d696c92133ce7c3cc5939cd3cdb12ede34a4faf728ad4acc1feae9bce17939fb"
    else
      url "https://github.com/Yukaii/ccmux/releases/download/v1.1.1/ccmux-macos-x64"
      sha256 "f6fe9c66d21cc762c04678cdd3f529c14db9e0963d0e9656dd15536e290e3faa"
    end
  end

  on_linux do
    url "https://github.com/Yukaii/ccmux/releases/download/v1.1.1/ccmux-linux-x64"
    sha256 "59cd95685684079de931786a346b468fdbbaacc9007c326c58a0e25873581b18"
  end

  def install
    binary_name = stable.url.split("/").last
    bin.install binary_name => "ccmux"
  end

  test do
    system "#{bin}/ccmux", "--version"
  end
end
