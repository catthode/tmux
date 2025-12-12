# Catthode Tmux

> **From CRT to OLED.** Bringing warmth back to a world of cold themes.

Catthode is a high-contrast, retro-futuristic theme designed for prolonged coding sessions. It blends the crushed blacks of modern OLED displays with the comforting, warm glow of analog tungsten filaments.

## 🎨 Color Palette

### Surface
| Color | Hex | Role |
| :--- | :--- | :--- |
| **Base** | `#000000` | Background, pure void |
| **Sidebar** | `#141414` | Panels, widgets |
| **Selection** | `#2d2d2d` | Text selection, active states |
| **Border** | `#636363` | Borders, subtle dividers |

### Phosphor
| Color | Hex | Role |
| :--- | :--- | :--- |
| **Text** | `#ffffff` | Standard text |
| **Variable** | `#e8e8e8` | Variables, identifiers |
| **Comment** | `#b3b3b3` | Comments |
| **Ignored** | `#757575` | Ignored elements |

### Glow
| Color | Hex | Role |
| :--- | :--- | :--- |
| **Wheat** | `#fae2c8` | Bright glow |
| **Tan** | `#d9b98c` | Secondary glow |
| **Gold** | `#ffb86c` | Headers, keywords |
| **Amber** | `#ff9e3b` | Accents, active states |
| **Clay** | `#f08d49` | Operators, punctuation |

### Accents
| Color | Hex | Role |
| :--- | :--- | :--- |
| **Red** | `#ff6b6b` | Errors, deletions, dangerous actions |
| **Green** | `#b9d665` | Strings, insertions, success |
| **Cyan** | `#aee6d6` | Regex, escapes, information |
| **Blue** | `#9cd9e6` | Links, properties, secondary info |
| **Purple** | `#eba4be` | Constants, numbers, booleans |

## 📦 Installation

Catthode Tmux can be installed for all platforms in a uniform way within a few lines of codes. The recommended manager is [tpm][gh-tmux-plugins/tpm].

### Quick Start

To automatically download and activate Catthode Tmux, follow the install instructions for [tpm][gh-tmux-plugins/tpm] and

1. add `set -g @plugin "catthode/tmux"` to your [`tmux.conf`][tmux-man-tmux.conf], by default `.tmux.conf` located in your [home directory][wiki-home_dir]
2. press the default key binding `prefix` + <kbd>I</kbd> to fetch- and install the plugin

[gh-tmux-plugins/tpm]: https://github.com/tmux-plugins/tpm
[tmux-man-tmux.conf]: http://man.openbsd.org/OpenBSD-current/man1/tmux.1#FILES
[wiki-home_dir]: https://en.wikipedia.org/wiki/Home_directory