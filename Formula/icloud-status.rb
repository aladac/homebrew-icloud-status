class IcloudStatus < Formula
  desc "macOS CLI tool to display comprehensive iCloud status information"
  homepage "https://github.com/saiden-dev/icloud-status"
  version "0.1.2"
  license "MIT"

  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/icloud-status/releases/download/v#{version}/icloud-status-v#{version}-macos.tar.gz"
      sha256 "19b1bd0c8f2f5ecbecb948c7292e46d0abf70549f5ece040a950787429e0dc1a"
    end
  end

  def install
    bin.install "icloud-status"
  end

  test do
    assert_match "icloud-status", shell_output("#{bin}/icloud-status --version")
  end
end
