class Browse < Formula
  desc "Headless browser automation for Claude Code using Playwright WebKit"
  homepage "https://github.com/saiden-dev/browse"
  url "https://registry.npmjs.org/@saiden/browse/-/browse-0.4.0.tgz"
  sha256 "0df70370e76d7aec3bc253f907539dcdaf49800229ae958efc682a471e000785"
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
