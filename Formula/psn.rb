class Psn < Formula
  include Language::Python::Virtualenv

  desc "Persona system for Claude Code - MCP server, memory, TTS, cartridges"
  homepage "https://github.com/aladac/psn"
  url "https://github.com/aladac/psn.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/aladac/psn.git", branch: "master"

  depends_on "python@3.14"

  def install
    virtualenv_create(libexec, "python3.14")
    system libexec/"bin/pip", "install", "--no-deps", "."
    system libexec/"bin/pip", "install", "mcp>=1.0.0", "piper-tts>=1.4.0",
           "typer>=0.12.0", "rich>=13.0.0", "pydantic>=2.0.0", "pyyaml>=6.0.0"
    bin.install_symlink libexec/"bin/psn"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
