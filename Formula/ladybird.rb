class Ladybird < Formula
  desc 'Ladybird web browser'
  homepage 'https://github.com/LadybirdBrowser/ladybird'
  head 'https://github.com/LadybirdBrowser/ladybird.git', branch: 'master'
  version '0.1.0'
  license 'BSD-2-Clause'

  depends_on 'autoconf' => :build
  depends_on 'autoconf-archive' => :build
  depends_on 'automake' => :build
  depends_on 'cmake' => :build
  depends_on 'nasm' => :build
  depends_on 'ninja' => :build
  depends_on 'ccache' => :build
  depends_on 'pkg-config' => :build
  depends_on 'llvm' => :build
  depends_on 'python@3.12' => :build

  def install
    ENV["CC"] = Formula["llvm"].opt_bin/"clang"
    ENV["CXX"] = Formula["llvm"].opt_bin/"clang++"

    system "python3", "./Meta/ladybird.py", "build"

    # Replace build-time lib symlink with a real copy for packaging
    app_contents = "Build/release/bin/Ladybird.app/Contents"
    rm_rf "#{app_contents}/lib"
    cp_r "Build/release/lib", app_contents

    app_path = "Build/release/bin/Ladybird.app"
    prefix.install app_path
    bin.install_symlink "#{prefix}/Ladybird.app/Contents/MacOS/Ladybird" => "ladybird"
  end

  def caveats
    <<~EOS
      Ladybird is in pre-alpha stage and is intended for developers only.
      See https://github.com/LadybirdBrowser/ladybird for more info.
    EOS
  end

  test do
    assert_predicate prefix/"Ladybird.app", :exist?
  end
end
