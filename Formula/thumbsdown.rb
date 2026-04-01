class Thumbsdown < Formula
  desc "Generate thumbnail grids from video files using ffmpeg"
  homepage "https://github.com/aladac/thumbsdown"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-macos-arm64"
      sha256 "27594c19e95b1c6a3db2c2228bf3270b03e05db016b10ace67d9298bc0b88d43"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-linux-arm64"
      sha256 "a6a8264b9f989ace6566dd3a76a4b57861f25480f0154fd4c1f2d627537a6476"
    end

    on_intel do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-linux-amd64"
      sha256 "60ad6a8ad5d1af7e98782301214f34473c5395745dd7e2b0ec95615ee6bfac6d"
    end
  end

  depends_on "ffmpeg"

  def install
    binary = Dir["thumbsdown-*"].first || "thumbsdown"
    bin.install binary => "thumbsdown"
  end

  test do
    assert_match "thumbsdown", shell_output("#{bin}/thumbsdown --help")
  end
end
