class Psn < Formula
  desc "Persona system for Claude Code - MCP server, memory, TTS, cartridges"
  homepage "https://github.com/aladac/psn"
  url "https://github.com/aladac/psn.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/aladac/psn.git", branch: "master"

  depends_on "python@3.14"

  # Disable relinking - cryptography Rust binary has insufficient mach-o header space
  pour_bottle? only_if: :clt_installed

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"

    # Install into share to avoid Homebrew's library relinking
    venv = share/"venv"
    system python, "-m", "venv", venv
    system venv/"bin/pip", "install", "--no-cache-dir", "."

    # Create wrapper script
    (bin/"psn").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/psn" "$@"
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
