# Space Shooter (Beta)

A 2D space shooter built with [LÖVE](https://love2d.org/) (Lua).

You pilot a craft at the bottom of the screen and fight a line of enemy crafts coming from the top. Destroy them all and a new formation appears. Survive as long as you can and get the highest score.

> **Status: beta.** The full loop works (menu, play, game over, restart). Animations and more polish are planned.

## Gameplay

- Move your craft and shoot the enemies lined up across the top of the screen
- Enemies shoot back
- Destroy every enemy and a new formation emerges
- Each kill adds to your score
- If your craft is destroyed, the game is over and you can restart

## Features

- Scrolling space background
- Menu, countdown, playing, and game over screens
- Background music, plus shooting, explosion, and score sound effects
- Clean restart after game over

## Run it

1. Install [LÖVE](https://love2d.org/) (11.x).
2. Clone the repo:
   ```
   git clone https://github.com/YOUR_USERNAME/YOUR_REPO.git
   cd YOUR_REPO
   ```
3. Run it:
   ```
   love .
   ```

## Controls

<!-- TODO: fill in your real keys -->
| Key | Action |
|---|---|
| Arrow keys | Move |
| Space | Shoot |
| Enter | Start / restart |

## Roadmap

- [ ] Animations (explosions, craft movement)
- [ ] More enemy behavior
- [ ] Difficulty that increases over time

## Credits

<!-- TODO: fill in where each asset came from and its license -->
- Music: `8bit_music.mp3`
- Sound effects: `shot.wav`, `explosion.wav`, `score.wav`
- Font: Orbitron (SIL Open Font License)
- Images
