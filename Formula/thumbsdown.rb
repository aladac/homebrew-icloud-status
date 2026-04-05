class Thumbsdown < Formula
  desc "Generate thumbnail grids from video files using ffmpeg"
  homepage "https://github.com/aladac/thumbsdown"
  version "0.1.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-macos-arm64"
      sha256 "f45b9691b3cf82fdbe858d8db160ddaca1b1af963bd4952afc7ff8a4f550dff3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-linux-arm64"
      sha256 "7fb224694be50e93906344682d5db79f9904a086df22f40545913fe4e8a4cf36"
    end

    on_intel do
      url "https://github.com/aladac/thumbsdown/releases/download/v#{version}/thumbsdown-linux-amd64"
      sha256 "0488e0015c8202258412032d1328ad1b35ebd19bd2d7c34c92d047f47538ab4a"
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
