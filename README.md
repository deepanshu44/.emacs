# .emacs.d

A modern, fast Emacs configuration built for Emacs 29+, tailored for TypeScript/TSX development, efficient minibuffer completion, Git workflows, and Org mode.

---

## Installation

Clone directly into `~/.emacs.d`:

```bash
git clone https://github.com/deepanshu44/.emacs ~/.emacs.d
emacs
```

> **First Boot:** On a fresh installation, Emacs automatically detects missing packages and downloads/byte-compiles all dependencies from MELPA without manual confirmation. Subsequent launches skip network checks and boot instantly from local cache.

---

## Prerequisites

- **Emacs 29.1+** (built with `--with-tree-sitter` and native compilation recommended)
- **Git**
- **ripgrep (`rg`)** – Minibuffer searching with Consult
- **Node.js & npm** – For language servers (e.g., `typescript-language-server` via Eglot)
