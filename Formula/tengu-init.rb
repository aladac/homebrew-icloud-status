class TenguInit < Formula
  desc "Provision Tengu PaaS on Hetzner Cloud"
  homepage "https://github.com/saiden-dev/tengu-init"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/tengu-init/releases/download/v#{version}/tengu-init-apple-silicon"
      sha256 "dc16ae6a2e88420df0edababe814ab1ba7f158778adfe901e53e626880a576d4"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/saiden-dev/tengu-init/releases/download/v#{version}/tengu-init-linux-arm64"
      sha256 "6aa81436a2a75533329897ba4e71f17eec7aed0dd13c8fd273d05e4b665c97e4"
    end

    on_intel do
      url "https://github.com/saiden-dev/tengu-init/releases/download/v#{version}/tengu-init-linux-amd64"
      sha256 "bbc5d2d8f7d6d8f2cca85efdfa5c2fec1fabaaf72dfdf6cde345edd25978e5d0"
    end
  end

  def install
    binary = Dir["tengu-init-*"].first || "tengu-init"
    bin.install binary => "tengu-init"
  end

  test do
    assert_match "tengu-init", shell_output("#{bin}/tengu-init --version")
  end
end
