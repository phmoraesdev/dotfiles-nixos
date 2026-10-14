 # 🚀 Dotfiles

Minha configuração pessoal do NixOS com o gerenciador de janelas Hyprland.

## 📋 Conteúdo

- [Visão Geral](#-visão-geral)
- [Requisitos](#-requisitos)
- [Instalação](#-instalação)
- [Personalização](#-personalização)
- [Atalhos](#-atalhos-de-teclado)
- [Temas](#-temas)
- [Licença](#-licença)


## 🔍 Visão Geral

Estes dotfiles foram criados para proporcionar um ambiente de desenvolvimento Linux elegante, eficiente e altamente produtivo. Configurações cuidadosamente ajustadas para gerenciadores de janelas, terminais, editores e muito mais!

### 🖥️ Sistema Base
- **Distro**: NixOS
- **Shell**: Fish
- **Terminal**: Kitty

### 📦 Interface e Gerenciamento

- **Window Manager**: Hyprland
- **Bar**: Waybar
- **Launcher**: Wofi
- **Power Menu**: Wlogout 
- **Lock Screen**: hyprlock

### 🎨 Estética e Notificações

- **Notifications**: dunst
- **Wallpapers**: swww
- **Fonts**: JetBrainsMono Nerd Font

### 🛠️ Ferramentas de Produtividade
- **File Manager**: Dholpin
- **Editor**: Neovim


## 📦 Requisitos

- Linux (testado em NixOS + Hyprland)
- Git

## 💻 Instalação

Este repositório é **multi-host**: o `flake.nix` define uma configuração por
máquina em `nixosConfigurations`. Hoje existem duas:

| Host       | Pasta               | Hardware                          |
|------------|----------------------|------------------------------------|
| `desktop`  | `hosts/desktop/`     | CPU AMD + GPU NVIDIA (proprietária)|
| `thinkpad` | `hosts/thinkpad/`    | ThinkPad X1 Carbon, GPU Intel      |

Tudo que é comum (Hyprland, Home Manager, pacotes, etc.) fica em
`configuration.nix` e `home.nix`/`home/*.nix`. Cada pasta `hosts/<host>/`
só tem o `hardware-configuration.nix` daquela máquina e um `host.nix` com
as diferenças (bootloader, GPU).

1. Clone este repositório:
```bash
git clone https://github.com/phmoraesdev/dotfiles-nixos
```

2. Faça backup da configuração atual e crie um link simbólico:
```bash
sudo mv /etc/nixos /etc/nixos.bak
sudo ln -s ~/dotfiles /etc/nixos
```

3. Aplique a configuração do host certo:
```bash
sudo nixos-rebuild switch --flake /etc/nixos#desktop   # no desktop
sudo nixos-rebuild switch --flake /etc/nixos#thinkpad  # no ThinkPad
```

> ⚠️ Cada host tem seu próprio `hardware-configuration.nix` em
> `hosts/<host>/hardware-configuration.nix` — é gerado automaticamente e é
> específico daquela máquina (nunca copie de um host para outro). Para
> gerar o de uma máquina nova sem sobrescrever o `configuration.nix` comum:
> ```bash
> sudo nixos-generate-config --dir /tmp/hwcfg
> cp /tmp/hwcfg/hardware-configuration.nix hosts/<host>/hardware-configuration.nix
> ```

### ➕ Adicionando um novo host

1. Crie `hosts/<novo-host>/` com `hardware-configuration.nix` (gerado como
   acima) e um `host.nix` com as particularidades daquela máquina.
2. Adicione `nixosConfigurations.<novo-host> = mkHost "<novo-host>";` no
   `flake.nix`.
3. Se precisar de ajustes específicos no Home Manager (ex.: resolução do
   monitor em `home/hyprland.nix`), use o argumento `hostname` disponível
   em qualquer módulo via `specialArgs`/`extraSpecialArgs`.


## 🖌️ Personalização

Os dotfiles foram projetados para serem facilmente personalizáveis:

- **Cores e Temas**: Edite os arquivos de configuração para alterar esquemas de cores
- **Fontes**: A configuração usa fonts Nerd ou JetBrains Mono por padrão
- **Ícones**: Compatível com diversos pacotes de ícones
- **Comportamentos**: Ajuste atalhos de teclado e comportamentos nos respectivos arquivos de configuração

## ⌨️ Atalhos de Teclado

Atalhos do Hyprland

| Atalho | Ação |
|--------|------|
| `Super + Enter` | Abrir terminal |
| `Super + Q` | Abrir menu de aplicativos |
| `Super + backspace` | Fechar janela atual |
| `Super + 1-9` | Alternar entre workspaces |
| `Super + Shift + 1-9` | Mover janela para workspace |
| `Super + F` | Alternar modo fullscreen |
| `Super + Mouse` | Mover janelas flutuantes |


## 📄 Licença

Este projeto está licenciado sob a [MIT License](LICENSE).

---

<div align="center">
  <p>Feito por <a href="https://github.com/phmoraesdev">Pedro Moraes</a></p>
  <p>Inspirado por várias configurações incríveis da comunidade Linux</p>
</div>
