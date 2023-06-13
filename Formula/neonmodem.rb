class Neonmodem < Formula
  desc "Neonmodem is a modem for your terminal"
  homepage "https://github.com/mrusme/neonmodem"
  url "https://github.com/mrusme/neonmodem/releases/download/v1.0.2/neonmodem_1.0.2_darwin_amd64.tar.gz"
  sha256 "4d3875df2bf46b71ce2b8ff11d80851bd4be53c265c950e9fbee1f185cc79b47"
  version "1.0.2"

  def install
    bin.install "neonmodem"
  end

  test do
    system "#{bin}/neonmodem", "--version"
  end
end
