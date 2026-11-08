class Chinwag < Formula
  desc "Read and reply to WhatsApp from the Mac terminal (for WhatsApp Desktop on macOS)"
  homepage "https://github.com/zorinto/chinwag"
  url "https://github.com/zorinto/chinwag/archive/refs/tags/v0.1.1.tar.gz"
  sha256 "3ce042aa52cbf7e23c99d88bd85182ef30f4f4d3dfff6fea7308b0e60671bf04"
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
