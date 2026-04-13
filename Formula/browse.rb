class Browse < Formula
  desc "Headless browser automation for Claude Code using Playwright WebKit"
  homepage "https://github.com/saiden-dev/browse"
  url "https://registry.npmjs.org/@saiden/browse/-/browse-0.3.3.tgz"
  sha256 "94ad00a7148604cd043b5a41663dbbdca11a9c1e8b1995085e4fc48e8e4f1d34"
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
