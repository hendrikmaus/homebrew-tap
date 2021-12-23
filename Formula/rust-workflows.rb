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
    root_url "https://github.com/hendrikmaus/homebrew-tap/releases/download/rust-workflows-0.4.0"
    sha256 cellar: :any_skip_relocation, big_sur:      "d4eaf74f5187b28a9b2008a3d27f11994276c24b00698cd679f333bae6ece366"
    sha256 cellar: :any_skip_relocation, x86_64_linux: "41a304ea2ee849062deffa889384394ce4df1134d1f0ef6900ef55d1e5032df8"
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
