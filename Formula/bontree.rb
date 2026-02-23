class Bontree < Formula
  desc 'A file explorer to pair with your favourite agent'
  homepage 'https://github.com/almonk/bontree'
  version '0.0.6'
  license 'MIT'
  head 'https://github.com/almonk/bontree.git', branch: 'main'

  on_macos do
    on_intel do
      url "https://github.com/almonk/bontree/releases/download/v#{version}/bontree-darwin-amd64"
      sha256 '5734b79fce20c826afaf5bcdd9959aa48d39704b93f49241d43f0bdfbb68f20a'
    end
    on_arm do
      url "https://github.com/almonk/bontree/releases/download/v#{version}/bontree-darwin-arm64"
      sha256 'f59831fd0ecaf8e1082902e01e83283d2d1c0e4ac7096133df7b43a4c7823af6'
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/almonk/bontree/releases/download/v#{version}/bontree-linux-amd64"
      sha256 '9904e1b120fa0be511e6f8c938d709d08dcf04ffc11507188c3b646a549ec12e'
    end
    on_arm do
      url "https://github.com/almonk/bontree/releases/download/v#{version}/bontree-linux-arm64"
      sha256 '90407ebd152fc199e84a71b598ff9ce9d2d71c955fe57c75a3f5515ec0dcbb6a'
    end
  end

  depends_on 'go' => :build if build.head?

  def install
    if build.head?
      bin.mkpath
      system 'go', 'build', '-o', bin / 'bontree', '.'
    else
      bin.install "bontree-#{OS.kernel_name.downcase}-#{Hardware::CPU.arch.to_s.gsub(/x86_64/, 'amd64')}" => 'bontree'
    end
  end

  test do
    assert_match 'bontree', shell_output("#{bin}/bontree --help 2>&1", 1)
  end
end
