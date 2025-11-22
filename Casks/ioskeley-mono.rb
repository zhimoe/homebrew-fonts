cask "ioskeley-mono" do
  # ioskeley-mono: 是字体名称 brew install --cask ioskeley-mono
  version "latest"
  # 不检查 sha256，因为每次发布都会变化
  sha256 :no_check

  # 下载 zip 文件：注意这个 URL 要指向 Releases 页面的 IoskeleyMono-TTF-Hinted.zip
  url "https://github.com/ahatem/IoskeleyMono/releases/latest/download/IoskeleyMono-TTF-Hinted.zip",
      verified: "github.com/ahatem/IoskeleyMono/"

  name "Ioskeley Mono"
  desc "terminal font: Iosevka configured to mimic Berkeley Mono"
  homepage "https://github.com/ahatem/IoskeleyMono"

  # 版本检查：使用 GitHub 最新发布策略
  livecheck do
    url :url
    strategy :github_latest
  end

  # stage_only true: 是什么用途？不能和 font 同时存在

  # homebrew 的 cask 有 stanza 段落命令概念 主要是一些常用操作封装成专门的命令
  # font stanza 用于安装字体文件，表示将文件移动到 ~/Library/Fonts
  # 安装字体
  font "TTF/IoskeleyMono-Regular.ttf"
  font "TTF/IoskeleyMono-Italic.ttf"
  font "TTF/IoskeleyMono-Bold.ttf"
  font "TTF/IoskeleyMono-BoldItalic.ttf"

  # 卸载字体 brew uninstall --zap ioskeley-mono
  zap trash: Dir["#{Dir.home}/Library/Fonts/IoskeleyMono-*.ttf"]
end
