class Browse < Formula
  desc "Headless browser automation for Claude Code using Playwright WebKit"
  homepage "https://github.com/saiden-dev/browse"
  url "https://registry.npmjs.org/@saiden/browse/-/browse-0.2.20.tgz"
  sha256 "6d7198496680ad1ae042273171aedc27a42152388bea69c6f0a9a368c12ddf32"
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
