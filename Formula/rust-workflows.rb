class RustWorkflows < Formula
  desc "Reference project for GitHub Action workflows to use on Rust projects"
  homepage "https://github.com/hendrikmaus/rust-workflows"
  url "https://github.com/hendrikmaus/rust-workflows/archive/refs/tags/v0.5.0.tar.gz"
  sha256 "492292ea296f5403dba2792d65413b5fa523eca955c849e82c436c516776846e"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  bottle do
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.5.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "f729e7a7b7e5c9a6d64d4d696e1834d97e7360d461d2d8a577abbb40a4d615a9"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "6ce858fab7069b2e1f9bad0ec9a30ce09216d5c3d6b311f4f443305df9cbcaca"
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
