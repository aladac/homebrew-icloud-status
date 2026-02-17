class Psn < Formula
  desc "Persona system for Claude Code - MCP server, memory, TTS, cartridges"
  homepage "https://github.com/aladac/psn"
  url "https://github.com/aladac/psn.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/aladac/psn.git", branch: "master"

  depends_on "python@3.14"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"
    venv = libexec

    # Create venv with pip
    system python, "-m", "venv", venv

    # Install package and dependencies
    system venv/"bin/pip", "install", "."

    # Link binary
    bin.install_symlink venv/"bin/psn"
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
