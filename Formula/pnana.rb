class Pnana < Formula
  desc "Modern terminal text editor built with FTXUI"
  homepage "https://github.com/Cyxuan0311/PNANA"
  url "https://github.com/Cyxuan0311/PNANA/archive/refs/tags/v0.0.4.tar.gz"
  sha256 "c26074ade81e515f949432e81d22753fed114efe70e0edd906c4d143d651a7af"
  license "MIT"
  head "https://github.com/Cyxuan0311/PNANA.git", branch: "master"

  option "with-lua", "Build with Lua plugin support"
  option "with-tree-sitter", "Build with Tree-sitter syntax highlighting"
  option "with-image-preview", "Build with FFmpeg image preview support"

  depends_on "cmake" => :build
  depends_on "ftxui"
  depends_on "ffmpeg" => :optional
  depends_on "lua" => :optional
  depends_on "tree-sitter" => :optional

  def install
    args = %w[
      -DCMAKE_BUILD_TYPE=Release
    ]

    args << "-DBUILD_LUA=ON" if build.with?("lua")
    args << "-DBUILD_TREE_SITTER=ON" if build.with?("tree-sitter")
    args << "-DBUILD_IMAGE_PREVIEW=ON" if build.with?("image-preview")

    system "cmake", "-S", ".", "-B", "build", *args, *std_cmake_args
    system "cmake", "--build", "build"
    system "cmake", "--install", "build"
  end

  test do
    assert_match "Version", shell_output("#{bin}/pnana --version 2>&1")
  end
end
