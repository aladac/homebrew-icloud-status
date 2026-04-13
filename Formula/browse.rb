class Browse < Formula
  desc "Headless browser automation for Claude Code using Playwright WebKit"
  homepage "https://github.com/saiden-dev/browse"
  url "https://registry.npmjs.org/@saiden/browse/-/browse-0.3.1.tgz"
  sha256 "5a234b4d732eab76f6180cbcfba810e9ec1858c3943ffd811680b1127b1ad11f"
  license "MIT"

  depends_on "node"

  def install
    system "npm", "install", *std_npm_args
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  def caveats
    <<~EOS
      To complete installation, run:
        npx playwright install webkit
    EOS
  end

  test do
    assert_match "browse", shell_output("#{bin}/browse --help")
  end
end
