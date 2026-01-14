# My homebrew taps

```bash
brew tap Yukaii/tap
```

## Available formula

### [`warpd`](https://github.com/rvaiya/warpd)

Co-create with [GPT4-chan](https://shareg.pt/r8Sd126)

```bash
brew install warpd
brew services start warpd
```

### [`simple completion language server`](https://github.com/estin/simple-completion-language-server)

```bash
brew install --head simple-complection-language-server
```

### [`justfont 精靈文 Elffont`](https://github.com/justfont/Elffont)

```bash
brew install font-elffont
```

### [`gitlinker`](https://github.com/Yukaii/gitlinker.cr)

```bash
brew install --head gitlinker
```

### [`pnana`](https://github.com/Cyxuan0311/PNANA)

Modern terminal text editor built with FTXUI.

```bash
brew install pnana

# Optional features
brew install pnana --with-lua          # Lua plugin support
brew install pnana --with-tree-sitter  # Tree-sitter syntax highlighting
brew install pnana --with-image-preview # FFmpeg image preview
```

## Development

### Testing formulas locally before pushing

When the tap is installed from GitHub, new formulas won't be recognized until pushed. To test locally, copy the formula to the installed tap location:

```bash
cp Formula/your-formula.rb /opt/homebrew/Library/Taps/yukaii/homebrew-tap/Formula/
brew install yukaii/tap/your-formula
brew test yukaii/tap/your-formula
```
