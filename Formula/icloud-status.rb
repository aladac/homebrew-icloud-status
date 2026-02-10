class IcloudStatus < Formula
  desc "macOS CLI tool to display comprehensive iCloud status information"
  homepage "https://github.com/saiden-dev/icloud-status"
  url "https://github.com/saiden-dev/icloud-status/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "68d356dd8966c44cc2e0cabc9a74e0d680595313b192d4137ee5d487f876d09e"
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
