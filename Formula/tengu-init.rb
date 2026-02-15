class TenguInit < Formula
  desc "Provision Tengu PaaS on Hetzner Cloud"
  homepage "https://github.com/saiden-dev/tengu-init"
  version "0.1.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/saiden-dev/tengu-init/releases/download/v0.1.5/tengu-init-apple-silicon"
      sha256 "d5942d6dbc8f22dfdfe511c0588e2c15413241ce94bcee8188b14524c8e908a0"
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
