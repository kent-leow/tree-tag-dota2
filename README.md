# Tree Tag - Dota 2 Arcade Game

A custom Dota 2 arcade game addon featuring tree-based gameplay mechanics.

## Overview

Tree Tag is a creative arcade mode for Dota 2 that introduces unique gameplay mechanics centered around trees and tag-based interactions. This addon provides a fresh, entertaining experience for players looking for something different from traditional Dota 2.

## Features

- **Custom Game Mode**: Unique tree tag mechanics
- **Custom Abilities**: Specialized hero abilities designed for this mode
- **Custom Items**: Tailored items for balanced gameplay
- **Custom Units**: Unique unit types and behaviors
- **Visual Effects**: Custom particles and trails for enhanced visuals
- **Ambient Effects**: Dynamic particle effects to enhance atmosphere

## Project Structure

```
tree_tag_xxvi/
├── scripts/               # Game logic and configuration
│   ├── npc/              # NPC and balance definitions
│   │   ├── npc_abilities_custom.txt
│   │   ├── npc_heroes_custom.txt
│   │   ├── npc_items_custom.txt
│   │   └── npc_units_custom.txt
│   └── vscripts/         # Lua scripts
│       └── addon_game_mode.lua
├── particles/            # Particle effect definitions
│   ├── basic_ambient/
│   ├── basic_explosion/
│   ├── basic_projectile/
│   ├── basic_rope/
│   └── basic_trail/
├── materials/            # Material and texture files
│   └── particle/         # Particle textures
├── resource/             # UI and localization
│   ├── addon_english.txt
│   └── flash3/
│       └── custom_ui.txt
├── addoninfo.txt         # Addon metadata
└── README.md             # This file
```

## Installation

1. Clone this repository into your Dota 2 addons folder:
   ```bash
   cd "C:\Program Files (x86)\Steam\steamapps\common\dota 2 beta\game\dota_addons\"
   git clone https://github.com/kent-leow/tree-tag-dota2.git tree_tag_xxvi
   ```

2. Launch Dota 2 and enable the addon through the arcade menu.

## How to Play

[Add specific game mode instructions here]

## Gameplay Mechanics

- **Tree Mechanics**: [Describe core tree interaction mechanics]
- **Tag System**: [Describe the tag-based gameplay]
- **Victory Conditions**: [Describe how to win]

## Balance

All custom abilities, items, and units are carefully balanced for fair and engaging gameplay. Report balance issues or suggestions via GitHub issues.

## Development

### Prerequisites
- Dota 2 installed with SDK tools
- Hammer (map editor) for particle editing
- Text editor for script modifications

### Building Particles
Particle effects (.vpcf) are pre-compiled. To modify them:
1. Use Hammer's particle editor
2. Recompile the .vpcf files
3. Test in-game through the arcade menu

### Modifying Game Balance
Edit the following files to adjust balance:
- `scripts/npc/npc_abilities_custom.txt` - Ability values
- `scripts/npc/npc_items_custom.txt` - Item costs and effects
- `scripts/npc/npc_heroes_custom.txt` - Hero stats
- `scripts/npc/npc_units_custom.txt` - Unit definitions

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## Version History

### v1.0.0 (Initial Release)
- Initial release with core tree tag mechanics
- Basic custom abilities and items
- Custom particle effects
- Custom UI elements

## License

This project is released as-is for use with Dota 2. Please respect Valve's intellectual property and community guidelines.

## Acknowledgments

- Valve Software for Dota 2 and the custom game framework
- The Dota 2 modding community for resources and inspiration

## Support

For issues, questions, or suggestions:
- Open an issue on GitHub
- Check existing issues for solutions
- Review the Dota 2 modding documentation

## Resources

- [Dota 2 Modding Documentation](https://developer.valvesoftware.com/wiki/Dota_2_Workshop_Tools)
- [Dota 2 Community Modding Discord](https://discord.gg/dota2modding)
- [Custom Games Hub](https://custom-games.dota2.com/)

---

**Enjoy playing Tree Tag!** 🌳
