class Hu < Formula
  desc "Token-efficient dev workflow CLI for Claude Code"
  homepage "https://github.com/saiden-dev/hu"
  version "0.1.13"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-macos-arm64"
      sha256 "bbd977e3bb90a128806318d2ef8a41e6aa2aa8f50ae0dff6906219cac2a6de18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-linux-arm64"
      sha256 "1e6ef1af74f197d6f14128533d829e1e84a2ac5ecb2ae3867d84ea1d74c2cec6"
    end

    on_intel do
      url "https://github.com/saiden-dev/hu/releases/download/v#{version}/hu-linux-amd64"
      sha256 "56c30353346ef0bba69f16493cef1bc88171ec1b843b8f912d72e808f6b7e796"
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
