class IcloudStatus < Formula
  desc "macOS CLI tool to display comprehensive iCloud status information"
  homepage "https://github.com/saiden-dev/icloud-status"
  version "0.1.3"
  license "MIT"

  depends_on :macos

  on_macos do
    url "https://github.com/saiden-dev/icloud-status/releases/download/v#{version}/icloud-status-v#{version}-macos.tar.gz"
    sha256 "5ff5b8b65d993a57c454c47f63066f96269163537fdc0475f2d099a142f842f6"
  end

  def install
    bin.install "icloud-status"
  end

  test do
    assert_match "icloud-status", shell_output("#{bin}/icloud-status --version")
  end
end
