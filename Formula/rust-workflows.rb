class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.9.0.tar.gz"
  sha256 "c6855a1c8420a594421eaf0b6c79cf106631d2dc7e2d270b47440c1f5132d5ec"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.9.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "46597ec0ad4684e1db78dc90c1e736b0b938191140f4c1dbf1d5f60e8ec984dd"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "09f66940b9a8d7fb2b9be714006e05d4ee118fb5d9a6bcdd9ae90bb4d138b6ce"
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
