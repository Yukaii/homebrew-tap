class Ladybird < Formula
  desc "Ladybird web browser"
  homepage "https://github.com/LadybirdBrowser/ladybird"
  url "https://github.com/LadybirdBrowser/ladybird.git", branch: "master"
  version "0.1.0"
  license "BSD-2-Clause"

  depends_on "autoconf" => :build
  depends_on "autoconf-archive" => :build
  depends_on "automake" => :build
  depends_on "cmake" => :build
  depends_on "ffmpeg" => :build
  depends_on "ninja" => :build
  depends_on "ccache" => :build
  depends_on "pkg-config" => :build
  depends_on "llvm" => :build
  depends_on "qt"

  def install
    ENV["HOMEBREW_CC"] = Formula["llvm"].opt_bin/"clang"
    ENV["HOMEBREW_CXX"] = Formula["llvm"].opt_bin/"clang++"
    ENV["CC"] = Formula["llvm"].opt_bin/"clang"
    ENV["CXX"] = Formula["llvm"].opt_bin/"clang++"

    system "./Meta/ladybird.sh", "build"

    prefix.install "Build/ladybird/bin/Ladybird.app"
    bin.install_symlink prefix/"Ladybird.app/Contents/MacOS/Ladybird" => "ladybird"
  end

  test do
    assert_match "Ladybird", shell_output("#{bin}/ladybird --version")
  end
end
