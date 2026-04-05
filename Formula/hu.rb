class Hu < Formula
  desc "Token-efficient dev workflow CLI for Claude Code"
  homepage "https://github.com/saiden-dev/hu"
  version "0.1.14"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-macos-arm64"
      sha256 "786c6a2f3431d0d52fd4572c1791821434d69cbeb8198d99021c9f3935ab59fb"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-linux-arm64"
      sha256 "6fb7592f491c22d75581aa2cee05a220c23fefd32c6ffdc508c511bc27eb876e"
    end

    on_intel do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-linux-amd64"
      sha256 "afbab665eb05217f72dcd16e109974b63b6b258cee21a4e6f2f1411651ee409e"
    end
  end

  def install
    binary = Dir["hu-*"].first || "hu"
    bin.install binary => "hu"
  end

  test do
    assert_match "hu", shell_output("#{bin}/hu --help")
  end
end
