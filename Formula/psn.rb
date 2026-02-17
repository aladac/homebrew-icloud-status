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

    venv = share/"venv"
    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", "."

    (bin/"psn").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/psn" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Note: A dylib relinking warning for cryptography is expected and harmless.
      The cryptography package uses a Rust binary with insufficient mach-o header
      space for Homebrew's relinking. This does not affect functionality.

      Verify installation with:
        psn --version
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
