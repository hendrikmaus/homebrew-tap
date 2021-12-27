class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.8.2.tar.gz"
  sha256 "5646bc28ca59cdb5771a035d9be5b7d200d4428aaccfdadea04ed2293a45ae16"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.8.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "c1f9d1b1eb7cb5b5e83345a096d25fda78bc9225a6c4144f25eecbf8fca59928"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "9362791937be4adc7b8b163d9122069f280b398ce7c2b4eb9b3e5b3b1f599a86"
  end

  head do
    url "https://github.com/hendrikmaus/rust-workflows.git", branch: "master"
  end

  depends_on "rust" => :build

  def install
    system "cargo", "install", *std_cargo_args
  end

  test do
    system "#{bin}/rust-workflows"
  end
end
