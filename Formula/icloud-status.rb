class IcloudStatus < Formula
  desc "macOS CLI tool to display comprehensive iCloud status information"
  homepage "https://github.com/saiden-dev/icloud-status"
  url "https://github.com/saiden-dev/icloud-status/archive/refs/tags/v0.1.2.tar.gz"
  sha256 "686e13d64f606c022056011c2db223d333d1ddfdad29b9b091094026a4639c70"
  license "MIT"
  head "https://github.com/saiden-dev/icloud-status.git", branch: "master"

  depends_on xcode: ["14.0", :build]
  depends_on :macos

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/icloud-status"
  end

  test do
    assert_match "icloud-status", shell_output("#{bin}/icloud-status --version")
  end
end
