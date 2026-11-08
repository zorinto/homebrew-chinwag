class Chinwag < Formula
  desc "Read and reply to WhatsApp from the Mac terminal (for WhatsApp Desktop on macOS)"
  homepage "https://github.com/zorinto/chinwag"
  url "https://github.com/zorinto/chinwag/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "a6ef51df181c026442d00dbf514b41ef866cf532cc1df7a270c2992c92a0831f"
  license "MIT"
  head "https://github.com/zorinto/chinwag.git", branch: "main"

  depends_on :macos
  # The Swift toolchain from the Command Line Tools is enough; `depends_on xcode: :build` would demand
  # the full Xcode app.
  uses_from_macos "swift" => :build

  def install
    system "swift", "build", "-c", "release", "--disable-sandbox"
    bin.install ".build/release/chinwag"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/chinwag --version")
    assert_match "Read and reply to WhatsApp", shell_output("#{bin}/chinwag --help")
  end
end
