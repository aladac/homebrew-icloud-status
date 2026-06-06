class Browse < Formula
  desc "Headless browser automation via MCP using Playwright WebKit"
  homepage "https://github.com/saiden-dev/browse"
  url "https://registry.npmjs.org/@saiden/browse/-/browse-0.4.2.tgz"
  sha256 "0b990135f15d6aa3bdbb7b4e1ce2598d5324a1f71f23d448eac153b85206dde7"
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
