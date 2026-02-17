class Psn < Formula
  desc "Persona system for Claude Code - MCP server, memory, TTS, cartridges"
  homepage "https://github.com/aladac/psn"
  url "https://github.com/aladac/psn.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/aladac/psn.git", branch: "master"

  depends_on "python@3.14"

  def install
    # Use pipx-style isolation to avoid Homebrew relinking issues
    ENV["PYTHONDONTWRITEBYTECODE"] = "1"
    ENV["PIP_DISABLE_PIP_VERSION_CHECK"] = "1"

    python = Formula["python@3.14"].opt_bin/"python3.14"
    venv = prefix/"venv"

    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", "."

    # Create wrapper script instead of symlink
    (bin/"psn").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/psn" "$@"
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
