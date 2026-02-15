class TenguInit < Formula
  desc "Provision Tengu PaaS on Hetzner Cloud"
  homepage "https://github.com/saiden-dev/tengu-init"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/tengu-init/releases/download/v0.1.1/tengu-init-apple-silicon"
      sha256 "cc87dde054bb2813dcf6f94066461a2a2f17ec62f6756cc579dfdb87ecad0b09"
    end
  end

  def install
    binary_name = "tengu-init-apple-silicon"
    bin.install binary_name => "tengu-init"
  end

  test do
    assert_match "tengu-init", shell_output("#{bin}/tengu-init --version")
  end
end
