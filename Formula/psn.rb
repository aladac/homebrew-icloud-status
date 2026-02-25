class Psn < Formula
  desc "Persona system for Claude Code - MCP server, memory, TTS, cartridges"
  homepage "https://github.com/aladac/psn"
  url "https://github.com/aladac/psn.git", branch: "master"
  version "0.1.0"
  license "MIT"
  head "https://github.com/aladac/psn.git", branch: "master"

  depends_on "python@3.14"
  depends_on "uv"

  def install
    python = Formula["python@3.14"].opt_bin/"python3.14"

    system "/opt/homebrew/opt/python@3.14/libexec/bin/pip", "install", "-e", ".", "--break-system-packages", "-q"

    (bin/"psn").write <<~EOS
      #!/bin/bash
      exec "#{venv}/bin/psn" "$@"
    EOS
  end

  def caveats
    <<~EOS
      Verify installation with:
        psn --version
    EOS
  end

  test do
    assert_match "Usage:", shell_output("#{bin}/psn --help")
  end
end
